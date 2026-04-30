import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/theme/light_theme.dart';
import '../../../data/local/courses_data.dart';
import '../../../data/local/institutions_data.dart';
import '../../../data/local/professions/data/professions_data.dart';
import '../../../data/models/favorite.dart';
import '../../../data/models/institution.dart';
import '../application/favorites_providers.dart';
import '../../../features/results/presentation/widgets/results_constants.dart';
import '../../../data/models/profession.dart';

class CourseDetailScreen extends ConsumerWidget {
  const CourseDetailScreen({super.key, required this.courseId});
  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final course = kCursos.where((c) => c.id == courseId).firstOrNull;

    if (course == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Curso')),
        body: const Center(child: Text('Curso não encontrado')),
      );
    }

    final theme = Theme.of(context);
    final isFavAsync = ref.watch(isFavoriteProvider(course.id));
    final isFav = isFavAsync.valueOrNull ?? false;

    final profissoesRelacionadas = kTodasProfissoes
        .where((p) => p.cursosRelacionados.contains(course.id))
        .toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: lightGradientHeader,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 8,
                left: 8,
                right: 16,
                bottom: 28,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          isFav
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFav ? Colors.red : Colors.white,
                        ),
                        onPressed: () => ref
                            .read(favoritesNotifierProvider.notifier)
                            .toggle(
                              itemId: course.id,
                              tipo: FavoriteType.curso,
                              nome: course.nome,
                              emoji: '🎓',
                              area: course.area,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('🎓', style: TextStyle(fontSize: 56)),
                  const SizedBox(height: 12),
                  Text(
                    course.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    course.area,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                if (course.duracao != null || course.requisitosMinimos != null)
                  Row(
                    children: [
                      if (course.duracao != null)
                        Expanded(
                          child: _InfoCard(
                            icon: PhosphorIcons.clock(),
                            label: 'Duração',
                            value: course.duracao!,
                            color: const Color(0xff6155F5),
                          ),
                        ),
                      if (course.duracao != null &&
                          course.requisitosMinimos != null)
                        const SizedBox(width: 12),
                      if (course.requisitosMinimos != null)
                        Expanded(
                          child: _InfoCard(
                            icon: PhosphorIcons.graduationCap(),
                            label: 'Requisitos',
                            value: course.requisitosMinimos!,
                            color: const Color(0xffFF9800),
                          ),
                        ),
                    ],
                  ),
                const SizedBox(height: 20),

                _Section(
                  title: 'Sobre o curso',
                  child: Text(
                    course.descricao,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Instituições corrigidas
                _Section(
                  title: '🏛️ Onde estudar em Moçambique',
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: course.instituicoesIds.map((id) {
                      final inst = kInstituicoes.firstWhere(
                        (i) => i.id == id,
                        orElse: () => Institution(
                          id: id,
                          acronym: id.toUpperCase().replaceAll('INST_', ''),
                          name: 'Desconhecida',
                          type: InstitutionType.publica,
                          province: Province.maputoCidade,
                        ),
                      );
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          inst.acronym,
                          style: TextStyle(
                            color: theme.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),

                if (profissoesRelacionadas.isNotEmpty)
                  _Section(
                    title: '💼 Profissões que podes seguir',
                    child: Column(
                      children: profissoesRelacionadas.map((prof) {
                        return _ProfessionTile(prof: prof, theme: theme);
                      }).toList(),
                    ),
                  ),
                const SizedBox(height: 32),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfessionTile extends StatelessWidget {
  const _ProfessionTile({required this.prof, required this.theme});
  final Profession prof;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(prof.emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              prof.nome,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PhosphorIcon(icon, color: color, size: 16),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
