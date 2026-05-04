import 'package:flutter/material.dart';
import '../../../results/application/results_providers.dart';

class TestsProgressBadge extends StatelessWidget {
  const TestsProgressBadge({super.key, required this.profile});

  final CombinedProfile profile;

  @override
  Widget build(BuildContext context) {
    final tests = [
      ('🎯', 'RIASEC', profile.riasec.isNotEmpty),
      ('🧠', 'Gardner', profile.gardner.isNotEmpty),
      ('⚖️', 'Valores', profile.valores.isNotEmpty),
    ];

    return Row(
      children: tests.map((t) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: t.$3
                  ? Colors.white.withValues(alpha: 0.25)
                  : Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(t.$1, style: const TextStyle(fontSize: 12)),
                const SizedBox(width: 4),
                Text(
                  t.$2,
                  style: TextStyle(
                    color: t.$3 ? Colors.white : Colors.white54,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (t.$3) ...[
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.check_circle_rounded,
                    color: Colors.white,
                    size: 12,
                  ),
                ],
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
