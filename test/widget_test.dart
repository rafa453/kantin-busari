import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app1/main.dart';

void main() {
  testWidgets('App renders home greeting', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.textContaining('Halo, selamat datang'), findsOneWidget);
    expect(find.text('Menu Hari Ini'), findsOneWidget);
  });
}