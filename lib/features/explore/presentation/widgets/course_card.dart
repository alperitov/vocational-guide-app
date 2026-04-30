import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/course.dart';
import '../../../../data/models/favorite.dart';
import '../../../../data/models/institution.dart'; // Adicionado
import '../../../../data/local/institutions_data.dart'; // Adicionado
import '../../application/favorites_providers.dart';

class CourseCard extends ConsumerWidget {
  const CourseCard({
    super.key,
    required this.course,
    required this.onTap,
    required this.onShare,
  });

  final Course course;
  final VoidCallback onTap;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isFavAsync = ref.watch(isFavoriteProvider(course.id));
    final isFav = isFavAsync.valueOrNull ?? false;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.area,
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          course.nome,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFav
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: isFav ? Colors.red : theme.colorScheme.outline,
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
              const SizedBox(height: 12),
              Text(
                course.descricao,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  // Lógica de mapeamento de IDs para Siglas (Acrónimos)
                  Wrap(
                    spacing: 6,
                    children: course
                        .instituicoesIds // Usando a lista de IDs
                        .take(2)
                        .map((id) {
                          final inst = kInstituicoes.firstWhere(
                            (i) => i.id == id,
                            orElse: () => Institution(
                              id: id,
                              acronym: id.toUpperCase().replaceAll('INST_', ''),
                              name: '?',
                              type: InstitutionType.publica,
                              province: Province.maputoCidade,
                            ),
                          );
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              inst.acronym,
                              style: TextStyle(
                                fontSize: 10,
                                color: theme.colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        })
                        .toList(),
                  ),
                  if (course.instituicoesIds.length > 2)
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        '+${course.instituicoesIds.length - 2}',
                        style: TextStyle(
                          fontSize: 10,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.share_rounded,
                      size: 20,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    onPressed: onShare,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
