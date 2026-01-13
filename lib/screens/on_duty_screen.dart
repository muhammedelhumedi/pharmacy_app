import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/pill_card.dart';

class OnDutyScreen extends StatelessWidget {
  const OnDutyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final list = const [
      ('ordu Eczanesi', 'Menderes, Salihg Hatun Cd., 24139 Demirkent/Erzincan'),
      ('Eda Eczanesi', 'Yenimahalle, Hacı Mehmet Ekinci Cd., 24100 Erzincan'),
      ('Emir Eczanesi', 'Karaağaç, 24040 Erzincan Merkez/Erzincan'),
      ('Neon Eczanesi', 'Neon Hastanesi Arkası, Ergenekon Mahallesi 102.sokak'),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('on_duty'.tr()),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white.withOpacity(0.88),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            itemBuilder: (_, i) {
              final item = list[i];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: PillCard(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.add, size: 22),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.$1,
                              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(item.$2),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
