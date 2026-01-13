import 'package:flutter/material.dart';
import '../ui/tokens.dart';

class StatChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;

  const StatChip(
      {super.key, required this.label, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final c = color ?? cs.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.10),
        borderRadius: Ui.br(999),
        border: Border.all(color: c.withValues(alpha: 0.22)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: c),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: c, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
