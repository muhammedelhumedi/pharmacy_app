import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/pill_card.dart';

class QAScreen extends StatefulWidget {
  const QAScreen({super.key});

  @override
  State<QAScreen> createState() => _QAScreenState();
}

class _QAScreenState extends State<QAScreen> {
  final q = TextEditingController(
    text: 'Apranax ilaç bağımlılık\nmadde içerir mi ?',
  );

  String answer =
      'Kodein morfin tipi ilaç bağımlılığı yapabilir.\n'
      'Özellikle uzun süreli kodein kullanımı\n'
      'sonrası oluşabilecek bağımlılık ilaç\n'
      'kesilmesini takiben yorgunluk, sinirlilik gibi\n'
      'bulgular şeklinde ortaya çıkabilir. Bu\n'
      'nedenle uzun süreyle kullanılacaksa doktor\n'
      'gözetiminde alınmalıdır.';

  @override
  void dispose() {
    q.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text('Q&A'),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language, color: Colors.black),
            onSelected: (locale) => context.setLocale(locale),
            itemBuilder: (_) => const [
              PopupMenuItem(value: Locale('en'), child: Text('EN')),
              PopupMenuItem(value: Locale('tr'), child: Text('TR')),
              PopupMenuItem(value: Locale('ar'), child: Text('AR')),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          PillCard(
            child: TextField(
              controller: q,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Type your question...',
              ),
            ),
          ),
          const SizedBox(height: 12),
          PillCard(
            child: Text(
              answer,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
