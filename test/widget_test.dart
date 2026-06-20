import 'package:flutter_test/flutter_test.dart';

import 'package:noor_life/app/app.dart';

void main() {
  testWidgets('App builds smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const NoorLifeApp());
    await tester.pump();
    expect(find.byType(NoorLifeApp), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 4));
  });
}
