import 'package:flutter/material.dart';

class PillCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const PillCard({super.key, required this.child, this.padding = const EdgeInsets.all(16)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 240),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 10),
            color: Colors.black.withValues(alpha: 38),
          ),
        ],
      ),
      child: child,
    );
  }
}
