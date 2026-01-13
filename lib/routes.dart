import 'package:flutter/material.dart';

import 'screens/medicine_screen.dart';
import 'screens/on_duty_screen.dart';
import 'screens/alarm_setup_screen.dart';
import 'screens/qa_screen.dart';

class AppRoutes {
  static const medicine = '/medicine';
  static const onDuty = '/on_duty';
  static const alarm = '/alarm';
  static const qa = '/qa';

  static final map = <String, WidgetBuilder>{
    medicine: (_) => const MedicineScreen(),
    onDuty: (_) => const OnDutyScreen(),
    alarm: (_) => const AlarmSetupScreen(),
    qa: (_) => const QAScreen(),
  };
}
