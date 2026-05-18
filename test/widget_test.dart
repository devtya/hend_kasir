import 'package:flutter_test/flutter_test.dart';

import 'package:hend_kasir/main.dart';

void main() {
  testWidgets('App should display main menu', (WidgetTester tester) async {
    await tester.pumpWidget(const HendKasirApp());
    expect(find.text('Hend Kasir'), findsWidgets);
  });
}
