import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../screens/main_shell.dart';

class UserShell extends StatelessWidget {
  const UserShell({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User',
      theme: AppTheme.light(),
      home: const MainShell(),
    );
  }
}
