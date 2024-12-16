import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_project/models/client.dart';
import 'package:provider_project/models/client_type.dart';
import 'package:provider_project/models/provider/client_types.dart';
import 'package:provider_project/models/provider/clients.dart';
import 'package:provider_project/models/provider/selected_client_type.dart';
import 'package:provider_project/models/provider/selected_icon.dart';

void main() {
  group('Client tests', () {
    final Client carlitos = Client(
      name: 'Carlitos',
      email: 'carlitos@gmail.com',
      type: ClientType(name: 'Gold', icon: Icons.star),
    );

    test('Clients model should add a new client', () {
      Clients clients = Clients(clients: []);

      clients.add(carlitos);
      clients.add(carlitos);

      expect(clients.clients, [carlitos, carlitos]);
    });

    test('Clients model should be empty', () {
      Clients clients = Clients(clients: [carlitos, carlitos]);

      clients.removeAt(1);
      clients.removeAt(0);

      expect(clients.clients, []);
    });
  });

  group('ClientTypes tests', () {
    final ClientType saphiraType = ClientType(
      name: 'Saphira',
      icon: Icons.games_rounded,
    );

    test('ClientsTypes model should add a new type', () {
      ClientTypes clientTypes = ClientTypes(clientTypes: []);

      clientTypes.add(saphiraType);

      clientTypes.add(saphiraType);

      expect(clientTypes.clientTypes, [saphiraType, saphiraType]);
    });

    test('ClientsTypes model should be empty', () {
      ClientTypes clientTypes = ClientTypes(clientTypes: [saphiraType, saphiraType]);

      clientTypes.removeAt(1);

      clientTypes.removeAt(0);

      expect(clientTypes.clientTypes, []);
    });
  });

  group('SelectedClientType tests', () {
    final ClientType saphiraType = ClientType(
      name: 'Saphira',
      icon: Icons.games_rounded,
    );

    test('SelectedClientType should change its value', () {
      SelectedClientType selectedClientType = SelectedClientType();

      selectedClientType.choose(saphiraType);

      expect(selectedClientType.selectedClientType, saphiraType);
    });
  });

  group('SelectedIcon tests', () {
    const IconData iconData = Icons.car_crash;

    test('SelectedIcon should change its value', () {
      SelectedIcon selectedIcon = SelectedIcon();

      selectedIcon.choose(iconData);

      expect(selectedIcon.selectedIcon, iconData);
    });
  });
}
