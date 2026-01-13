import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LangButton extends StatelessWidget {
  const LangButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language, color: Colors.white),
      onSelected: (loc) => context.setLocale(loc),
      itemBuilder: (_) => const [
        PopupMenuItem(value: Locale('en'), child: Text('EN')),
        PopupMenuItem(value: Locale('tr'), child: Text('TR')),
        PopupMenuItem(value: Locale('ar'), child: Text('AR')),
      ],
    );
  }
}
