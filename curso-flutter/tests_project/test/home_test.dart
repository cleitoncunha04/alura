import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tests_project/components/box_card.dart';
import 'package:tests_project/data/bank_inherited.dart';
import 'package:tests_project/screens/home.dart';

import 'bank_http.mocks.dart';

void main() {
  final MockBankHttp mockBankHttp = MockBankHttp();

  testWidgets(
    'My widget has a text "Spent"',
    (WidgetTester widgetTester) async {
      when(mockBankHttp.dolarToReal()).thenAnswer(
        (_) async => '5',
      );
      
      // Desenha a tela
      await widgetTester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: mockBankHttp.dolarToReal(),
            ),
          ),
        ),
      );

      verify(mockBankHttp.dolarToReal()).called(1);

      // Espera achar 01 Widget que tenha o texto 'Spent';
      final spentFinder = find.text('Spent');

      expect(spentFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Finds a LinearProgressIndicator',
    (WidgetTester widgetTester) async {
      when(mockBankHttp.dolarToReal()).thenAnswer(
        (_) async => '5',
      );
      
      await widgetTester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: mockBankHttp.dolarToReal(),
            ),
          ),
        ),
      );

      verify(mockBankHttp.dolarToReal()).called(1);

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'Finds the key "testKey"',
    (WidgetTester widgetTester) async {
      when(mockBankHttp.dolarToReal()).thenAnswer(
        (_) async => '5',
      );
      
      await widgetTester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: mockBankHttp.dolarToReal(),
            ),
          ),
        ),
      );

      verify(mockBankHttp.dolarToReal()).called(1);

      expect(
        find.byKey(
          const Key('testKey'),
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Finds 5 BoxCard',
    (WidgetTester widgetTester) async {
      when(mockBankHttp.dolarToReal()).thenAnswer(
        (_) async => '5',
      );

      await widgetTester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: mockBankHttp.dolarToReal(),
            ),
          ),
        ),
      );

      verify(mockBankHttp.dolarToReal()).called(1);

      expect(
        find.byWidgetPredicate((widget) => widget is BoxCard),
        findsNWidgets(5),
      );
    },
  );

  testWidgets(
    'When tap Deposit should upload earned in 10',
    (WidgetTester widgetTester) async {
      when(mockBankHttp.dolarToReal()).thenAnswer(
        (_) async => '5',
      );
      
      await widgetTester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: mockBankHttp.dolarToReal(),
            ),
          ),
        ),
      );

      verify(mockBankHttp.dolarToReal()).called(1);

      await widgetTester.tap(
        find.text('Deposit'),
      );

      await widgetTester.tap(
        find.text('Earned'),
      );

      // Recarrega todos os micro processos que alteram a tela
      await widgetTester.pumpAndSettle();

      expect(find.text('\$10.0'), findsOneWidget);
    },
  );

  testWidgets(
    'Testing MockHttp dolarToReal',
    (WidgetTester widgetTester) async {
      when(mockBankHttp.dolarToReal()).thenAnswer(
        (_) async => '5',
      );

      await widgetTester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: mockBankHttp.dolarToReal(),
            ),
          ),
        ),
      );

      verify(mockBankHttp.dolarToReal()).called(1);
    },
  );
}
