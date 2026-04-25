import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:share_plus/share_plus.dart';
import '../../../data/local/courses_data.dart';
import '../../../data/local/professions_data.dart';
import '../../../data/models/favorite.dart';
import '../../../data/models/profession.dart';
import '../../../core/theme/light_theme.dart';
import '../application/favorites_providers.dart';
import '../../../features/results/presentation/widgets/results_constants.dart';

class ProfessionDetailScreen extends ConsumerWidget {
  const ProfessionDetailScreen({super.key, required this.professionId});
  final String professionId;

  Color _mercadoColor(MercadoTrabalho m) => switch (m) {
    MercadoTrabalho.excelente => const Color(0xff4CAF50),
    MercadoTrabalho.bom => const Color(0xff8BC34A),
    MercadoTrabalho.moderado => const Color(0xffFFC107),
    MercadoTrabalho.limitado => const Color(0xffF44336),
  };

  String _mercadoLabel(MercadoTrabalho m) => switch (m) {
    MercadoTrabalho.excelente => 'Mercado Excelente',
    MercadoTrabalho.bom => 'Bom Mercado',
    MercadoTrabalho.moderado => 'Mercado Moderado',
    MercadoTrabalho.limitado => 'Mercado Limitado',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profession = kProfissoes
        .where((p) => p.id == professionId)
        .firstOrNull;

    if (profession == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Profissão')),
        body: const Center(child: Text('Profissão não encontrada')),
      );
    }

    final theme = Theme.of(context);
    final isFavAsync = ref.watch(isFavoriteProvider(profession.id));
    final isFav = isFavAsync.valueOrNull ?? false;
    final cursosRelacionados = kCursos
        .where((c) => profession.cursosRelacionados.contains(c.id))
        .toList();
    final mercadoCor = _mercadoColor(profession.mercadoTrabalho);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Cabeçalho
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
                  // AppBar row
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
                              itemId: profession.id,
                              tipo: FavoriteType.profissao,
                              nome: profession.nome,
                              emoji: profession.emoji,
                              area: profession.areaConhecimento,
                            ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.share_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () => SharePlus.instance.share(
                          ShareParams(
                            text:
                                '${profession.emoji} ${profession.nome}\n\n${profession.descricao}\n\nDescobre mais na app Guivo!',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Emoji e nome
                  Text(profession.emoji, style: const TextStyle(fontSize: 56)),
                  const SizedBox(height: 12),
                  Text(
                    profession.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    profession.areaConhecimento,
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
                // Mercado e Salário
                Row(
                  children: [
                    Expanded(
                      child: _InfoCard(
                        icon: PhosphorIcons.trendUp(),
                        label: 'Mercado',
                        value: _mercadoLabel(profession.mercadoTrabalho),
                        color: mercadoCor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (profession.salarioMedio != null)
                      Expanded(
                        child: _InfoCard(
                          icon: PhosphorIcons.currencyDollar(),
                          label: 'Salário médio',
                          value: profession.salarioMedio!,
                          color: const Color(0xff4CAF50),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),

                // Descrição
                _Section(
                  title: 'Sobre a profissão',
                  child: Text(
                    profession.descricao,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Mercado em Moçambique
                if (profession.detalhesMercado != null)
                  _Section(
                    title: '📍 Mercado em Moçambique',
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: mercadoCor.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: mercadoCor.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        profession.detalhesMercado!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),

                // Perfil ideal
                _Section(
                  title: '🎯 Perfil ideal',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (profession.dimRiasec.isNotEmpty) ...[
                        Text(
                          'RIASEC',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: profession.dimRiasec.map((d) {
                            final cor =
                                dimensaoCores[d] ?? theme.colorScheme.primary;
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: cor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: cor.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Text(
                                '${dimensaoEmojis[d] ?? ''} ${dimensaoNomes[d] ?? d}',
                                style: TextStyle(
                                  color: cor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Cursos relacionados
                if (cursosRelacionados.isNotEmpty)
                  _Section(
                    title: '🎓 Cursos que levam a esta profissão',
                    child: Column(
                      children: cursosRelacionados.map((curso) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Text('🎓', style: TextStyle(fontSize: 20)),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      curso.nome,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      curso.instituicoes.join(', '),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            theme.colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                const SizedBox(height: 20),

                // Instituições
                _Section(
                  title: '🏛️ Onde estudar em Moçambique',
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: profession.instituicoes
                        .map(
                          (inst) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              inst,
                              style: TextStyle(
                                color: theme.colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 32),

                // Botão favorito
                SizedBox(
                  height: 52,
                  child: FilledButton.icon(
                    onPressed: () => ref
                        .read(favoritesNotifierProvider.notifier)
                        .toggle(
                          itemId: profession.id,
                          tipo: FavoriteType.profissao,
                          nome: profession.nome,
                          emoji: profession.emoji,
                          area: profession.areaConhecimento,
                        ),
                    style: FilledButton.styleFrom(
                      backgroundColor: isFav
                          ? Colors.red
                          : theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    icon: Icon(
                      isFav
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                    ),
                    label: Text(
                      isFav
                          ? 'Remover dos favoritos'
                          : 'Adicionar aos favoritos',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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

// Widgets auxiliares
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
    final theme = Theme.of(context);
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
