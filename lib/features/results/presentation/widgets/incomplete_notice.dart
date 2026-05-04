import 'package:flutter/material.dart';

import '../../application/results_providers.dart';

class IncompleteNotice extends StatelessWidget {
  const IncompleteNotice({required this.profile, required this.onTap});
  final CombinedProfile profile;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final missing = <String>[];
    if (profile.riasec.isEmpty) missing.add('RIASEC');
    if (profile.gardner.isEmpty) missing.add('Gardner');
    if (profile.valores.isEmpty) missing.add('Valores');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffFFF3E0),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xffFF9800).withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        children: [
          const Text('⚠️', style: TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Perfil incompleto',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xffE65100),
                  ),
                ),
                Text(
                  'Faz o(s) teste(s) ${missing.join(', ')} para uma análise mais precisa.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xffE65100),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    'Completar testes →',
                    style: TextStyle(
                      color: Color(0xffE65100),
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
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
