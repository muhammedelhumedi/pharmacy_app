import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/pill_card.dart';
import 'reminder_screen.dart';

class AlarmSetupScreen extends StatefulWidget {
  const AlarmSetupScreen({super.key});

  @override
  State<AlarmSetupScreen> createState() => _AlarmSetupScreenState();
}

class _AlarmSetupScreenState extends State<AlarmSetupScreen> {
  final med = TextEditingController(text: 'NOROXIN®');
  TimeOfDay t = const TimeOfDay(hour: 9, minute: 25);
  String repeat = 'every_day';

  @override
  Widget build(BuildContext context) {
    final timeStr = '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text('set_alarm'.tr())),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 460,
                child: PillCard(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
                        child: Row(
                          children: [
                            Text('set_alarm'.tr(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                            const Spacer(),
                            IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      _RowItem(
                        title: 'medicine_name'.tr(),
                        value: med.text,
                        onTap: () async {
                          final v = await _editText(context, med.text);
                          if (v != null) setState(() => med.text = v);
                        },
                      ),
                      const Divider(height: 1),
                      _RowItem(
                        title: 'time'.tr(),
                        value: timeStr,
                        onTap: () async {
                          final picked = await showTimePicker(context: context, initialTime: t);
                          if (picked != null) setState(() => t = picked);
                        },
                      ),
                      const Divider(height: 1),
                      _RowItem(
                        title: 'repeat'.tr(),
                        value: repeat == 'every_day' ? 'every_day'.tr() : repeat,
                        onTap: () async {
                          final v = await showModalBottomSheet<String>(
                            context: context,
                            builder: (_) => ListView(
                              shrinkWrap: true,
                              children: [
                                ListTile(title: Text('every_day'.tr()), onTap: () => Navigator.pop(context, 'every_day')),
                                const ListTile(title: Text('Mon-Fri (demo)')),
                                const ListTile(title: Text('Custom (demo)')),
                              ],
                            ),
                          );
                          if (v != null) setState(() => repeat = v);
                        },
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6A1B9A),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ReminderScreen(
                                    time: timeStr,
                                    message: 'merhaba muhammed ${med.text}\nilaçı alma zamanı',
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.send),
                            label: Text('set'.tr(), style: const TextStyle(fontWeight: FontWeight.w900)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text('copyright'.tr(), style: const TextStyle(color: Colors.white70)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _editText(BuildContext context, String initial) async {
    final c = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit'),
        content: TextField(controller: c),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(context, c.text), child: const Text('OK')),
        ],
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;
  const _RowItem({required this.title, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(value, style: const TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF6A1B9A))),
      onTap: onTap,
    );
  }
}
