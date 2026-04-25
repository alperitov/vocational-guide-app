import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/theme/light_theme.dart';
import '../../../data/models/favorite.dart';
import '../../../features/explore/application/favorites_providers.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesAsync = ref.watch(favoritesNotifierProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          // Cabeçalho
          Container(
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
              right: 20,
              bottom: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Expanded(
                      child: Text(
                        'Os meus favoritos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    PhosphorIcon(PhosphorIcons.heart(), color: Colors.white70),
                  ],
                ),
                const SizedBox(height: 16),

                // Abas
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: const Color(0xff6155F5),
                    unselectedLabelColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                    dividerColor: Colors.transparent,
                    padding: const EdgeInsets.all(3),
                    tabs: const [
                      Tab(text: '💼  Profissões'),
                      Tab(text: '🎓  Cursos'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Conteúdo
          Expanded(
            child: favoritesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Erro: $e')),
              data: (favorites) {
                final profissoes = favorites
                    .where((f) => f.tipo == FavoriteType.profissao)
                    .toList();
                final cursos = favorites
                    .where((f) => f.tipo == FavoriteType.curso)
                    .toList();

                return TabBarView(
                  controller: _tabController,
                  children: [
                    _FavoritesList(
                      favorites: profissoes,
                      tipo: FavoriteType.profissao,
                      emptyMessage: 'Nenhuma profissão favorita',
                      emptySubtitle:
                          'Explora profissões e adiciona as que te interessam',
                      onTap: (f) =>
                          context.go('/explore/profession/${f.itemId}'),
                      onRemove: (f) => ref
                          .read(favoritesNotifierProvider.notifier)
                          .toggle(
                            itemId: f.itemId,
                            tipo: f.tipo,
                            nome: f.nome ?? '',
                            emoji: f.emoji ?? '💼',
                            area: f.area ?? '',
                          ),
                    ),
                    _FavoritesList(
                      favorites: cursos,
                      tipo: FavoriteType.curso,
                      emptyMessage: 'Nenhum curso favorito',
                      emptySubtitle:
                          'Explora cursos e adiciona os que te interessam',
                      onTap: (f) => context.go('/explore/course/${f.itemId}'),
                      onRemove: (f) => ref
                          .read(favoritesNotifierProvider.notifier)
                          .toggle(
                            itemId: f.itemId,
                            tipo: f.tipo,
                            nome: f.nome ?? '',
                            emoji: f.emoji ?? '🎓',
                            area: f.area ?? '',
                          ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoritesList extends StatelessWidget {
  const _FavoritesList({
    required this.favorites,
    required this.tipo,
    required this.emptyMessage,
    required this.emptySubtitle,
    required this.onTap,
    required this.onRemove,
  });

  final List<Favorite> favorites;
  final FavoriteType tipo;
  final String emptyMessage;
  final String emptySubtitle;
  final Function(Favorite) onTap;
  final Function(Favorite) onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (favorites.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tipo == FavoriteType.profissao ? '💼' : '🎓',
                style: const TextStyle(fontSize: 56),
              ),
              const SizedBox(height: 16),
              Text(
                emptyMessage,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                emptySubtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
        final fav = favorites[i];
        return Dismissible(
          key: Key(fav.id),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => onRemove(fav),
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.red.shade400,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.delete_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          child: GestureDetector(
            onTap: () => onTap(fav),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: theme.colorScheme.outlineVariant),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Emoji
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        fav.emoji ??
                            (tipo == FavoriteType.profissao ? '💼' : '🎓'),
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fav.nome ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          fav.area ?? '',
                          style: TextStyle(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Data
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.chevron_right_rounded,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${fav.criadoEm.day}/${fav.criadoEm.month}',
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
