import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'pharmacies_screen.dart';
import 'on_duty_screen.dart';
import 'profile_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    PharmaciesScreen(),
    OnDutyScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: 'nav_home'.tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.local_pharmacy_outlined),
            selectedIcon: const Icon(Icons.local_pharmacy),
            label: 'nav_pharmacies'.tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.access_time_outlined),
            selectedIcon: const Icon(Icons.access_time_filled),
            label: 'nav_on_duty'.tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            label: 'nav_profile'.tr(),
          ),
        ],
      ),
    );
  }
}
