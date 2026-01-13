import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../screens/role_switcher.dart';

class PharmacyShell extends StatelessWidget {
  const PharmacyShell({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharmacy',
      theme: AppTheme.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pharmacy Dashboard'),
          actions: [
            IconButton(
              tooltip: 'Switch Role',
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const RoleSwitcher())),
              icon: const Icon(Icons.swap_horiz),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Welcome, Pharmacy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Text('This is a clean placeholder for pharmacy users.'),
            ],
          ),
        ),
      ),
    );
  }
}
