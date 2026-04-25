import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/models/feed_post.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key, required this.post});
  final FeedPost post;

  Color _tipoColor(PostTipo tipo) => switch (tipo) {
    PostTipo.edital => const Color(0xff6155F5),
    PostTipo.bolsa => const Color(0xff4CAF50),
    PostTipo.evento => const Color(0xffFF9800),
    PostTipo.noticia => const Color(0xff2196F3),
    PostTipo.programa => const Color(0xff9C27B0),
  };

  String _tipoLabel(PostTipo tipo) => switch (tipo) {
    PostTipo.edital => 'Edital',
    PostTipo.bolsa => 'Bolsa',
    PostTipo.evento => 'Evento',
    PostTipo.noticia => 'Notícia',
    PostTipo.programa => 'Programa',
  };

  String _tipoEmoji(PostTipo tipo) => switch (tipo) {
    PostTipo.edital => '📋',
    PostTipo.bolsa => '🎯',
    PostTipo.evento => '📅',
    PostTipo.noticia => '📰',
    PostTipo.programa => '🎓',
  };

  String _formatDate(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inDays == 0) return 'Hoje';
    if (diff.inDays == 1) return 'Ontem';
    if (diff.inDays < 7) return 'Há ${diff.inDays} dias';
    return '${dt.day}/${dt.month}/${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cor = _tipoColor(post.tipo);

    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho do card
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Logo/emoji da instituição
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: cor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          post.logoInstituicao ?? '🏛️',
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.instituicao,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            _formatDate(post.dataPublicacao),
                            style: TextStyle(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Badge do tipo
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: cor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: cor.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _tipoEmoji(post.tipo),
                            style: const TextStyle(fontSize: 11),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _tipoLabel(post.tipo),
                            style: TextStyle(
                              color: cor,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Título
                Text(
                  post.titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 6),

                // Descrição
                Text(
                  post.descricao,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                // Data de expiração
                if (post.dataExpiracao != null) ...[
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      PhosphorIcon(
                        PhosphorIcons.clock(),
                        size: 14,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Prazo: ${post.dataExpiracao!.day}/${post.dataExpiracao!.month}/${post.dataExpiracao!.year}',
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // Rodapé com acções
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: theme.colorScheme.outlineVariant),
              ),
            ),
            child: Row(
              children: [
                if (post.url != null)
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () async {
                        final uri = Uri.parse(post.url!);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      icon: PhosphorIcon(
                        PhosphorIcons.arrowSquareOut(),
                        size: 16,
                      ),
                      label: const Text(
                        'Ver mais',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () => SharePlus.instance.share(
                      ShareParams(
                        text:
                            '${_tipoEmoji(post.tipo)} ${post.titulo}\n\n${post.descricao}\n\n${post.url ?? ''}\n\nVia app Guivo',
                      ),
                    ),
                    icon: PhosphorIcon(PhosphorIcons.share(), size: 16),
                    label: const Text(
                      'Partilhar',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
