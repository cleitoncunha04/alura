import 'package:flutter_listin/_core/services/cloud_service.dart';
import 'package:flutter_listin/listins/data/database.dart';

class CloudDataHandler {
  final CloudService _cloudService = CloudService();

  Future<String?> _clear() async {
    return await _cloudService.clear();
  }

  Future<String?> _upload({required AppDatabase appDatabase}) async {
    return await _cloudService.send(appDatabase);
  }

  Future<String?> _sinc({required AppDatabase appDatabase}) async {
    return await _cloudService.findAll(appDatabase);
  }

  Future<String?> handleCloudActions(
      {required String option, AppDatabase? appDatabase}) async {
    switch (option) {
      case 'removeCloud':
        return await _clear();

      case 'uploadCloud':
        if (appDatabase != null) {
          return await _upload(appDatabase: appDatabase);
        }

        break;
      case 'syncCloud':
        if (appDatabase != null) {
          return await _sinc(appDatabase: appDatabase);
        }
        break;
      default:
        return null;
    }
    return null;
  }
}
