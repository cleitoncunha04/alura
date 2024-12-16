import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/main.dart' as app;
import 'package:provider_project/models/provider/client_types.dart';
import 'package:provider_project/models/provider/clients.dart';
import 'package:provider_project/models/provider/selected_client_type.dart';
import 'package:provider_project/models/provider/selected_icon.dart';

void main() {
  // Garante que o app irá rodar no emulador antes de fazer os testes
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (WidgetTester widgetTester) async {
    final providerKey = GlobalKey();

    app.main(
      args: [],
      providerKey: providerKey,
    );

    await widgetTester.pumpAndSettle();

    // Testando a tela inicial
    expect(find.text('Clientes'), findsOneWidget);

    expect(find.byIcon(Icons.menu), findsOneWidget);

    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Testando o Drawer Menu
    await widgetTester.tap(find.byIcon(Icons.menu));

    await widgetTester.pumpAndSettle();

    expect(find.text('Menu'), findsOneWidget);

    expect(find.text('Gerenciar clientes'), findsOneWidget);

    expect(find.text('Tipos de clientes'), findsOneWidget);

    expect(find.text('Sair'), findsOneWidget);

    // Testando a navegação e a tela de Tipos de clientes
    await widgetTester.tap(find.text('Tipos de clientes'));

    await widgetTester.pumpAndSettle();

    expect(find.text('Tipos de cliente'), findsOneWidget);

    expect(find.byIcon(Icons.menu), findsOneWidget);

    expect(find.byType(FloatingActionButton), findsOneWidget);

    expect(find.text('Platinum'), findsOneWidget);

    expect(find.text('Golden'), findsOneWidget);

    expect(find.text('Titanium'), findsOneWidget);

    expect(find.text('Diamond'), findsOneWidget);

    // Testando a criação de um Tipo de cliente

    await widgetTester.tap(find.byType(FloatingActionButton));

    await widgetTester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);

    await widgetTester.enterText(find.byType(TextFormField), 'Iron');

    await widgetTester.tap(find.byIcon(Icons.touch_app_sharp));

    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.byIcon(Icons.card_giftcard));

    expect(
        Provider.of<SelectedIcon>(providerKey.currentContext!, listen: false)
            .selectedIcon,
        Icons.card_giftcard);

    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.byIcon(Icons.check));

    await widgetTester.pumpAndSettle();

    expect(find.text('Iron'), findsOneWidget);

    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

    expect(
        Provider.of<ClientTypes>(providerKey.currentContext!, listen: false)
            .clientTypes
            .last
            .name,
        'Iron');

    expect(
        Provider.of<ClientTypes>(providerKey.currentContext!, listen: false)
            .clientTypes
            .last
            .icon,
        Icons.card_giftcard);

    // Testando o cadastro de um novo cliente
    await widgetTester.tap(find.byIcon(Icons.menu));

    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.text('Gerenciar clientes'));

    await widgetTester.pumpAndSettle();

    expect(find.text('Clientes'), findsOneWidget);

    expect(find.byIcon(Icons.menu), findsOneWidget);

    expect(find.byType(FloatingActionButton), findsOneWidget);

    await widgetTester.tap(find.byType(FloatingActionButton));

    await widgetTester.pumpAndSettle();

    await widgetTester.enterText(find.byKey(const Key('nameKey')), 'Carlitos');

    await widgetTester.enterText(
        find.byKey(const Key('emailKey')), 'carlitos@gmail.com');

    await widgetTester.tap(find.byIcon(Icons.arrow_drop_down));

    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.text('Iron').last);

    await widgetTester.pumpAndSettle();

    expect(
        Provider.of<SelectedClientType>(providerKey.currentContext!,
                listen: false)
            .selectedClientType!
            .name,
        'Iron');

    expect(
        Provider.of<SelectedClientType>(providerKey.currentContext!,
                listen: false)
            .selectedClientType!
            .icon,
        Icons.card_giftcard);

    await widgetTester.tap(find.byIcon(Icons.check));

    await widgetTester.pumpAndSettle();

    expect(find.text('Carlitos (Iron)'), findsOneWidget);

    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

    expect(
        Provider.of<Clients>(providerKey.currentContext!, listen: false)
            .clients
            .last
            .name,
        'Carlitos');

    expect(
        Provider.of<Clients>(providerKey.currentContext!, listen: false)
            .clients
            .last
            .email,
        'carlitos@gmail.com');

    expect(
        Provider.of<Clients>(providerKey.currentContext!, listen: false)
            .clients
            .last
            .type,
        Provider.of<SelectedClientType>(providerKey.currentContext!,
                listen: false)
            .selectedClientType);
  });
}
