import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/role_gate.dart';

class RoleSwitcher extends StatefulWidget {
  const RoleSwitcher({super.key});

  @override
  State<RoleSwitcher> createState() => _RoleSwitcherState();
}

class _RoleSwitcherState extends State<RoleSwitcher> {
  String _role = 'user';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _role = prefs.getString('role') ?? 'user');
  }

  Future<void> _save(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', value);

    // Return to RoleGate and clear history
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const RoleGate()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch role')),
      body: ListView(
        children: [
          RadioListTile<String>(
            value: 'user',
            groupValue: _role,
            onChanged: (v) => v == null ? null : _save(v),
            title: const Text('User'),
          ),
          RadioListTile<String>(
            value: 'pharmacy',
            groupValue: _role,
            onChanged: (v) => v == null ? null : _save(v),
            title: const Text('Pharmacy'),
          ),
          RadioListTile<String>(
            value: 'admin',
            groupValue: _role,
            onChanged: (v) => v == null ? null : _save(v),
            title: const Text('Company (Admin)'),
          ),
        ],
      ),
    );
  }
}
