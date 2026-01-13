import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('tr'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final el = EasyLocalization.of(context);

    // If EasyLocalization is not mounted (e.g., in widget tests),
    // fall back to a plain MaterialApp.
    if (el == null) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pill',
        home: HomeScreen(),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pill',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: const HomeScreen(),
    );
  }
}
