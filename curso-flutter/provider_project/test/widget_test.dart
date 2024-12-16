import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_project/components/hamburger_menu.dart';

void main() {
  group('Testing Drawer Menu', () {
    testWidgets('Hamburger Menu should have "Menu"',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: HamburgerMenu(),
        ),
      );

      expect(find.text('Menu'), findsOneWidget);
    });

    testWidgets('Hamburger Menu should have "Gerenciar clientes"',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: HamburgerMenu(),
        ),
      );

      expect(find.text('Gerenciar clientes'), findsOneWidget);
    });

    testWidgets('Hamburger Menu should have "Tipos de clientes"',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: HamburgerMenu(),
        ),
      );

      expect(find.text('Tipos de clientes'), findsOneWidget);
    });

    testWidgets('Hamburger Menu should have "Sair"',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: HamburgerMenu(),
        ),
      );

      expect(find.text('Sair'), findsOneWidget);
    });
  });
}
