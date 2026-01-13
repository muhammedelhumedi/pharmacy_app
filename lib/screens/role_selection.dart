import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/role_gate.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({super.key});

  Future<void> _setRole(BuildContext context, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);

    // Go back to RoleGate and clear history
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const RoleGate()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose role')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _RoleTile(
              title: 'User',
              subtitle: 'Order & manage medicines',
              icon: Icons.person,
              onTap: () => _setRole(context, 'user'),
            ),
            const SizedBox(height: 12),
            _RoleTile(
              title: 'Pharmacy',
              subtitle: 'Manage orders & inventory',
              icon: Icons.local_pharmacy,
              onTap: () => _setRole(context, 'pharmacy'),
            ),
            const SizedBox(height: 12),
            _RoleTile(
              title: 'Company (Admin)',
              subtitle: 'Dashboard & management',
              icon: Icons.apartment,
              onTap: () => _setRole(context, 'admin'),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoleTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _RoleTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
