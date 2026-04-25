import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/favorite.dart';
import '../../../../data/models/profession.dart';
import '../../application/favorites_providers.dart';

class ProfessionCard extends ConsumerWidget {
  const ProfessionCard({
    super.key,
    required this.profession,
    required this.onTap,
    required this.onShare,
  });

  final Profession profession;
  final VoidCallback onTap;
  final VoidCallback onShare;

  Color _mercadoColor(MercadoTrabalho m) {
    return switch (m) {
      MercadoTrabalho.excelente => const Color(0xff4CAF50),
      MercadoTrabalho.bom => const Color(0xff8BC34A),
      MercadoTrabalho.moderado => const Color(0xffFFC107),
      MercadoTrabalho.limitado => const Color(0xffF44336),
    };
  }

  String _mercadoLabel(MercadoTrabalho m) {
    return switch (m) {
      MercadoTrabalho.excelente => 'Mercado excelente',
      MercadoTrabalho.bom => 'Bom mercado',
      MercadoTrabalho.moderado => 'Mercado moderado',
      MercadoTrabalho.limitado => 'Mercado limitado',
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isFavAsync = ref.watch(isFavoriteProvider(profession.id));
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
                children: [
                  // Emoji container
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        profession.emoji,
                        style: const TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profession.nome,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          profession.areaConhecimento,
                          style: TextStyle(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Favorito
                  IconButton(
                    icon: Icon(
                      isFav
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: isFav
                          ? Colors.red
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () => ref
                        .read(favoritesNotifierProvider.notifier)
                        .toggle(
                          itemId: profession.id,
                          tipo: FavoriteType.profissao,
                          nome: profession.nome,
                          emoji: profession.emoji,
                          area: profession.areaConhecimento,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                profession.descricao,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  // Mercado
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _mercadoColor(
                        profession.mercadoTrabalho,
                      ).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: _mercadoColor(profession.mercadoTrabalho),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _mercadoLabel(profession.mercadoTrabalho),
                          style: TextStyle(
                            color: _mercadoColor(profession.mercadoTrabalho),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Salário
                  if (profession.salarioMedio != null)
                    Text(
                      profession.salarioMedio!,
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const Spacer(),
                  // Partilhar
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
