import 'package:flutter_test/flutter_test.dart';
import 'package:uts_2455011010_nanda/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CineLogApp());
  });
}