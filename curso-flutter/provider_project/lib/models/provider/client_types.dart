import 'package:flutter/material.dart';

import 'package:provider_project/models/client_type.dart';

class ClientTypes extends ChangeNotifier {
  List<ClientType> clientTypes;
  
  ClientTypes({
    required this.clientTypes,
  });

  void add(ClientType clientType) {
    clientTypes.add(clientType);

    notifyListeners();
  } 

  void removeAt(int index) {
    clientTypes.removeAt(index);

    notifyListeners();
  }
 }
