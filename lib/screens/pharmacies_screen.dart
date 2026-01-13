import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'role_switcher.dart';

class PharmaciesScreen extends StatelessWidget {
  const PharmaciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title.pharmacies'.tr()),
        actions: [
          IconButton(
            tooltip: 'Switch Role',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const RoleSwitcher()),
            ),
            icon: const Icon(Icons.swap_horiz),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'pharmacies_title'.tr(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
