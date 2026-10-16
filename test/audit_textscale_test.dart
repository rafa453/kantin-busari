import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app1/pages/menu_detail_page.dart';
import 'package:app1/pages/menu_list_page.dart';
import 'package:app1/pages/order_page.dart';
import 'package:app1/pages/profile_page.dart';
import 'package:app1/theme/app_theme.dart';

// Audit probe: does the fixed-height layout survive a larger system text size?
// Evidence for the accessibility audit. Expected to FAIL until text scaling is
// handled; see .impeccable/critique/2026-10-16-kantin-bu-sari-audit.md.
void main() {
  Future<void> renderAt(WidgetTester tester, Widget page, double scale) async {
    await tester.pumpWidget(MaterialApp(
      theme: appTheme,
      home: MediaQuery(
        data: MediaQueryData(textScaler: TextScaler.linear(scale)),
        child: page,
      ),
    ));
    await tester.pump(const Duration(milliseconds: 100));
  }

  final pages = <String, Widget>{
    'menu_list': const MenuListPage(),
    'menu_detail': const MenuDetailPage(),
    'order': const OrderPage(),
    'profile': const ProfilePage(),
  };

  for (final scale in <double>[1.0, 1.3, 2.0]) {
    for (final entry in pages.entries) {
      testWidgets('${entry.key} @ textScale ${scale}x', (tester) async {
        await renderAt(tester, entry.value, scale);
        expect(tester.takeException(), isNull);
      });
    }
  }
}