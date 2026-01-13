import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/role_selection.dart';
import '../shells/user_shell.dart';
import '../shells/pharmacy_shell.dart';
import '../shells/admin_shell.dart';

class RoleGate extends StatefulWidget {
  const RoleGate({super.key});

  @override
  State<RoleGate> createState() => _RoleGateState();
}

class _RoleGateState extends State<RoleGate> {
  Future<String?> _loadRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _loadRole(),
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final role = snap.data;
        if (role == null) return const RoleSelection();

        switch (role) {
          case 'admin':
            return const AdminShell();
          case 'pharmacy':
            return const PharmacyShell();
          case 'user':
          default:
            return const UserShell();
        }
      },
    );
  }
}
