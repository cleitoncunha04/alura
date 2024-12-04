import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/models/client_type.dart';
import 'package:provider_project/models/provider/client_types.dart';
import 'package:provider_project/models/provider/selected_client_type.dart';
import 'package:provider_project/models/provider/selected_icon.dart';
import 'package:provider_project/models/provider/clients.dart';
import 'package:provider_project/pages/client_types_page.dart';
import 'package:provider_project/pages/clients_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Clients(clients: []),
        ),
        ChangeNotifierProvider(
          create: (_) => ClientTypes(clientTypes: [
            ClientType(
              name: 'Platinum',
              icon: Icons.credit_card,
            ),
            ClientType(
              name: 'Golden',
              icon: Icons.card_membership,
            ),
            ClientType(
              name: 'Titanium',
              icon: Icons.credit_score,
            ),
            ClientType(
              name: 'Diamond',
              icon: Icons.diamond,
            ),
          ]),
        ),
        ChangeNotifierProvider(
          create: (_) => SelectedIcon(),
        ),
        ChangeNotifierProvider(
          create: (_) => SelectedClientType(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de clientes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ClientsPage(title: 'Clientes'),
        '/tipos': (context) => const ClientTypesPage(title: 'Tipos de cliente'),
      },
    );
  }
}
