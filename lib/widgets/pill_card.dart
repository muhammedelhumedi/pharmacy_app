import 'package:flutter/material.dart';
import '../ui/tokens.dart';

class PillCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const PillCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: Ui.br(),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.6)),
        boxShadow: [
          BoxShadow(
            blurRadius: 18,
            offset: const Offset(0, 8),
            color: Colors.black.withValues(alpha: 0.06),
          )
        ],
      ),
      child: child,
    );

    if (onTap == null) return card;

    return InkWell(
      borderRadius: Ui.br(),
      onTap: onTap,
      child: card,
    );
  }
}
