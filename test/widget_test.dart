import 'package:flutter_test/flutter_test.dart';
import 'package:pill_app_clean/main.dart';

void main() {
  testWidgets('App builds', (tester) async {
    // Just ensure the app widget can be created without crashing.
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    expect(true, isTrue);
  });
}
