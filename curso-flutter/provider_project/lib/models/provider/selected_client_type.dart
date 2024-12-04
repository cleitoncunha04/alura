import 'package:flutter/material.dart';

import 'package:provider_project/models/client_type.dart';

class SelectedClientType extends ChangeNotifier {
  ClientType? selectedClientType;
  
  SelectedClientType({
    this.selectedClientType,
  });

  void choose(ClientType clientType) {
    selectedClientType = clientType;

    notifyListeners();
  }
}
