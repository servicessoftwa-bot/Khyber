import 'package:flutter_test/flutter_test.dart';
import 'package:khyber/main.dart';

void main() {
  testWidgets('Khyber app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const KhyberApp());
    expect(find.byType(KhyberApp), findsOneWidget);
  });
}