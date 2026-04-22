import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/student_profile.dart';
import '../../../data/models/provincia.dart';
import '../../../features/auth/application/auth_providers.dart';
import '../../../features/auth/data/auth_repository.dart';
import 'package:guivo/core/theme/toggle_theme.dart';
import '../application/profile_providers.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    final profileAsync = ref.watch(studentProfileProvider);
    final themeMode = ref.watch(themeModeProvider).value ?? ThemeMode.light;
    final isDark = themeMode == ThemeMode.dark;
    final theme = Theme.of(context);
    final photoAsync = ref.watch(_localPhotoProvider);
    final photoPath = photoAsync.valueOrNull;

    String _getInitials(String? displayName) {
      if (displayName == null || displayName.isEmpty) return 'U';
      final parts = displayName.trim().split(' ');
      if (parts.length == 1) return parts[0][0].toUpperCase();
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Editar perfil',
            onPressed: () => profileAsync.whenData((profile) {
              if (profile != null) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  builder: (_) => ProfileEditSheet(profile: profile),
                );
              }
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Avatar
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  backgroundImage: photoPath != null
                      ? FileImage(File(photoPath))
                      : (user?.photoURL != null
                            ? NetworkImage(user!.photoURL!) as ImageProvider
                            : null),
                  child: photoPath == null && user?.photoURL == null
                      ? Text(
                          _getInitials(user?.displayName),
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        )
                      : null,
                ),
                GestureDetector(
                  onTap: () async {
                    final picker = ImagePicker();
                    final picked = await picker.pickImage(
                      source: ImageSource.gallery,
                      maxWidth: 512,
                      maxHeight: 512,
                      imageQuality: 80,
                    );
                    if (picked != null) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('photo_${user?.uid}', picked.path);
                      ref.invalidate(_localPhotoProvider);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      size: 16,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              user?.displayName ?? 'Utilizador',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user?.email ?? '',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),

            // Dados do perfil
            profileAsync.when(
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Erro: $e'),
              data: (profile) {
                if (profile == null) {
                  return Text(
                    'Perfil não encontrado',
                    style: theme.textTheme.bodyMedium,
                  );
                }
                return _ProfileInfoCard(profile: profile);
              },
            ),
            const Divider(height: 40),

            // Tema
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
              title: const Text('Tema'),
              subtitle: Text(isDark ? 'Escuro' : 'Claro'),
              trailing: Switch(
                value: isDark,
                onChanged: (_) => ref.read(themeModeProvider.notifier).toggle(),
              ),
            ),
            const SizedBox(height: 8),

            // Logout
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: Icon(
                Icons.logout_rounded,
                color: theme.colorScheme.error,
              ),
              title: Text(
                'Terminar sessão',
                style: TextStyle(color: theme.colorScheme.error),
              ),
              onTap: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Terminar sessão'),
                    content: const Text(
                      'Tens a certeza que queres sair da tua conta?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(false),
                        child: const Text('Cancelar'),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.of(ctx).pop(true),
                        style: FilledButton.styleFrom(
                          backgroundColor: theme.colorScheme.error,
                        ),
                        child: const Text('Sair'),
                      ),
                    ],
                  ),
                );
                if (confirm == true) {
                  ref.read(authNotifierProvider.notifier).signOut();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileInfoCard extends StatelessWidget {
  const _ProfileInfoCard({required this.profile});
  final StudentProfile profile;

  static const _classeLabels = {
    Classe.oitava: '8ª Classe',
    Classe.nona: '9ª Classe',
    Classe.decima: '10ª Classe',
    Classe.decimaPrimeira: '11ª Classe',
    Classe.decimaSegunda: '12ª Classe',
  };

  static const _areaLabels = {
    AreaEstudo.ciencias: 'Ciências',
    AreaEstudo.letras: 'Letras',
    AreaEstudo.artes: 'Artes',
    AreaEstudo.comercial: 'Comercial',
    AreaEstudo.outro: 'Outro',
  };

  static const _generoLabels = {
    Genero.masculino: 'Masculino',
    Genero.feminino: 'Feminino',
    Genero.prefiroNaoDizer: 'Prefiro não dizer',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informação pessoal',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _InfoTile(
          icon: Icons.person_outline,
          label: 'Nome',
          value: profile.nome,
        ),
        if (profile.dataNascimento != null)
          _InfoTile(
            icon: Icons.cake_outlined,
            label: 'Data de nascimento',
            value:
                '${profile.dataNascimento!.day}/${profile.dataNascimento!.month}/${profile.dataNascimento!.year}',
          ),
        if (profile.genero != null)
          _InfoTile(
            icon: Icons.wc_outlined,
            label: 'Género',
            value: _generoLabels[profile.genero] ?? '',
          ),
        const SizedBox(height: 20),
        Text(
          'Informação académica',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        if (profile.provincia != null)
          _InfoTile(
            icon: Icons.location_on_outlined,
            label: 'Província',
            value: profile.provincia!,
          ),
        if (profile.escola != null)
          _InfoTile(
            icon: Icons.school_outlined,
            label: 'Escola',
            value: profile.escola!,
          ),
        if (profile.classe != null)
          _InfoTile(
            icon: Icons.class_outlined,
            label: 'Classe',
            value: _classeLabels[profile.classe] ?? '',
          ),
        if (profile.areaEstudo != null)
          _InfoTile(
            icon: Icons.book_outlined,
            label: 'Área de estudo',
            value: _areaLabels[profile.areaEstudo] ?? '',
          ),
        if (profile.interesses.isNotEmpty) ...[
          const SizedBox(height: 20),
          Text(
            'Interesses',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.interesses
                .map(
                  (i) => Chip(
                    label: Text(i, style: theme.textTheme.labelSmall),
                    visualDensity: VisualDensity.compact,
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(value, style: theme.textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}

// Bottom sheet de edição
class ProfileEditSheet extends ConsumerStatefulWidget {
  const ProfileEditSheet({super.key, required this.profile});
  final StudentProfile profile;

  @override
  ConsumerState<ProfileEditSheet> createState() => _ProfileEditSheetState();
}

class _ProfileEditSheetState extends ConsumerState<ProfileEditSheet> {
  late final TextEditingController _nomeController;
  late final TextEditingController _escolaController;
  late StudentProfile _profile;

  static const _classeLabels = {
    Classe.oitava: '8ª Classe',
    Classe.nona: '9ª Classe',
    Classe.decima: '10ª Classe',
    Classe.decimaPrimeira: '11ª Classe',
    Classe.decimaSegunda: '12ª Classe',
  };

  static const _areaLabels = {
    AreaEstudo.ciencias: 'Ciências',
    AreaEstudo.letras: 'Letras',
    AreaEstudo.artes: 'Artes',
    AreaEstudo.comercial: 'Comercial',
    AreaEstudo.outro: 'Outro',
  };

  static const _generoLabels = {
    Genero.masculino: 'Masculino',
    Genero.feminino: 'Feminino',
    Genero.prefiroNaoDizer: 'Prefiro não dizer',
  };

  @override
  void initState() {
    super.initState();
    _profile = widget.profile;
    _nomeController = TextEditingController(text: _profile.nome);
    _escolaController = TextEditingController(text: _profile.escola ?? '');
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _escolaController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final updated = _profile.copyWith(
      nome: _nomeController.text.trim(),
      escola: _escolaController.text.trim(),
    );
    await ref.read(profileEditorNotifierProvider.notifier).saveProfile(updated);
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSaving = ref.watch(profileEditorNotifierProvider).isLoading;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        24,
        24,
        24,
        MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Editar perfil',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Nome
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome completo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
            ),
            const SizedBox(height: 16),

            // Género
            Text('Género', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: Genero.values
                  .map(
                    (g) => ChoiceChip(
                      label: Text(_generoLabels[g]!),
                      selected: _profile.genero == g,
                      onSelected: (_) => setState(
                        () => _profile = _profile.copyWith(genero: g),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),

            // Província
            DropdownButtonFormField<String>(
              value: _profile.provincia,
              decoration: InputDecoration(
                labelText: 'Província',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              items: Provincias.lista
                  .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                  .toList(),
              onChanged: (v) =>
                  setState(() => _profile = _profile.copyWith(provincia: v)),
            ),
            const SizedBox(height: 16),

            // Escola
            TextFormField(
              controller: _escolaController,
              decoration: InputDecoration(
                labelText: 'Escola',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
            ),
            const SizedBox(height: 16),

            // Classe
            Text('Classe', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: Classe.values
                  .map(
                    (c) => ChoiceChip(
                      label: Text(_classeLabels[c]!),
                      selected: _profile.classe == c,
                      onSelected: (_) => setState(
                        () => _profile = _profile.copyWith(classe: c),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),

            // Área de estudo
            Text('Área de estudo', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: AreaEstudo.values
                  .map(
                    (a) => ChoiceChip(
                      label: Text(_areaLabels[a]!),
                      selected: _profile.areaEstudo == a,
                      onSelected: (_) => setState(
                        () => _profile = _profile.copyWith(areaEstudo: a),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 32),

            // Guardar
            FilledButton(
              onPressed: isSaving ? null : _save,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: isSaving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Guardar alterações'),
            ),
          ],
        ),
      ),
    );
  }
}

// Provider para foto local
final _localPhotoProvider = FutureProvider.autoDispose<String?>((ref) async {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) return null;
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('photo_${user.uid}');
});

// Função de iniciais
String _getInitials(String? displayName) {
  if (displayName == null || displayName.isEmpty) return 'U';
  final parts = displayName.trim().split(' ');
  if (parts.length == 1) return parts[0][0].toUpperCase();
  return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
}
