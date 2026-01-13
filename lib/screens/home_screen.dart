import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../ui/tokens.dart';
import '../widgets/pill_card.dart';
import '../widgets/section_header.dart';
import '../widgets/stat_chip.dart';
import 'role_switcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final List<_Pharmacy> _pharmacies = const [
    _Pharmacy(
        name: 'Central Pharmacy', addr: '12 Main St', status: _Status.open),
    _Pharmacy(
        name: 'Sunrise Pharmacy', addr: '45 King Ave', status: _Status.closed),
    _Pharmacy(
        name: '24/7 Care Pharmacy', addr: '8 Night Rd', status: _Status.onDuty),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('title.home'.tr()),
        actions: [
          IconButton(
            tooltip: 'Switch Role',
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const RoleSwitcher())),
            icon: const Icon(Icons.swap_horiz),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          SectionHeader(
            title: 'home.welcome'.tr(),
            subtitle: 'Find nearby pharmacies and manage meds quickly.',
            trailing:
                StatChip(label: 'Live', icon: Icons.bolt, color: cs.primary),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Ui.pad),
            child: PillCard(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'home.search_hint'.tr(),
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: cs.surfaceContainerHighest,
                        border: OutlineInputBorder(
                            borderRadius: Ui.br(14),
                            borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: const Icon(Icons.tune),
                    tooltip: 'Filters',
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const SectionHeader(
            title: 'Nearby pharmacies',
            subtitle: 'Quick status overview',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Ui.pad),
            child: Column(
              children: _pharmacies
                  .map((p) => Padding(
                        padding: const EdgeInsets.only(bottom: Ui.gap),
                        child: _PharmacyCard(p: p),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Ui.pad),
            child: PillCard(
              onTap: () {},
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: cs.primary.withValues(alpha: 0.12),
                    child: Icon(Icons.alarm, color: cs.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Set medicine reminders',
                            style: t.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 3),
                        Text('Never miss a dose — build a simple schedule.',
                            style: t.bodyMedium
                                ?.copyWith(color: cs.onSurfaceVariant)),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}

class _PharmacyCard extends StatelessWidget {
  final _Pharmacy p;
  const _PharmacyCard({required this.p});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    final (label, color, icon) = switch (p.status) {
      _Status.open => ('Open', Colors.green, Icons.check_circle_outline),
      _Status.closed => ('Closed', Colors.red, Icons.cancel_outlined),
      _Status.onDuty => ('On duty', Colors.orange, Icons.access_time),
    };

    return PillCard(
      onTap: () {},
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: cs.surfaceContainerHighest,
            child: Icon(Icons.local_pharmacy, color: cs.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p.name,
                    style:
                        t.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(p.addr,
                    style: t.bodyMedium?.copyWith(color: cs.onSurfaceVariant)),
                const SizedBox(height: 10),
                StatChip(label: label, icon: icon, color: color),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
        ],
      ),
    );
  }
}

enum _Status { open, closed, onDuty }

class _Pharmacy {
  final String name;
  final String addr;
  final _Status status;
  const _Pharmacy(
      {required this.name, required this.addr, required this.status});
}
