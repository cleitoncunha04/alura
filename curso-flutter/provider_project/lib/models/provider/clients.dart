// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:provider_project/models/client.dart';

class Clients extends ChangeNotifier {
  List<Client> clients;

  Clients({
    required this.clients,
  });

  void add(Client client) {
    clients.add(client);

    notifyListeners();
  }

  void removeAt(int index) {
    clients.removeAt(index);

    notifyListeners();
  }
}
