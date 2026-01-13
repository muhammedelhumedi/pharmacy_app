import 'package:flutter/material.dart';
import 'core/app_routes.dart';
import 'screens/home_screen.dart';
import 'screens/featured_products_screen.dart';

void main() {
  runApp(const PillApp());
}

class PillApp extends StatelessWidget {
  const PillApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pill',
      theme: ThemeData(useMaterial3: true),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.featured: (_) => FeaturedProductsScreen(),
      },
    );
  }
}
