import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReminderScreen extends StatelessWidget {
  final String time;
  final String message;
  const ReminderScreen({super.key, required this.time, required this.message});

  @override
  Widget build(BuildContext context) {
    final parts = time.split(':');
    final hh = parts.isNotEmpty ? parts[0] : '09';
    final mm = parts.length > 1 ? parts[1] : '25';

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF2F2F2), Color(0xFFE6E6E6)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(hh, style: const TextStyle(fontSize: 88, fontWeight: FontWeight.w900)),
                  Text(mm, style: const TextStyle(fontSize: 88, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 8),
                  Text('Sun, 09 July', style: TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w700)),
                  const SizedBox(height: 18),
                  Container(
                    width: 340,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                    child: Row(
                      children: [
                        const Icon(Icons.notifications),
                        const SizedBox(width: 10),
                        Text('reminder'.tr(), style: const TextStyle(fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 340,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                    child: Text(message, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
