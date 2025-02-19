import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_listin/_core/constants/cloud_endpoints.dart';
import 'package:flutter_listin/_core/data/local_data_handler.dart';
import 'package:flutter_listin/_core/services/cloud_interceptor.dart';
import 'package:flutter_listin/listins/data/database.dart';

class CloudService {
  CloudService() {
    _dio.interceptors.add(CloudInterceptor());
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: CloudEndpoints.hBaseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      connectTimeout: const Duration(
        seconds: 5,
      ),
      receiveTimeout: const Duration(
        seconds: 5,
      ),
    ),
  );

  Future<String?> send(AppDatabase appDatabase) async {
    try {
      Map<String, dynamic> localData =
          await LocalDataHandler().localDataToMap(appdatabase: appDatabase);

      await _dio.put(
        CloudEndpoints.listin,
        data: jsonEncode(
          localData['listins'],
        ),
      );
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        return e.response!.data!.toString();
      } else {
        return e.message;
      }
    } on Exception catch (_) {
      return 'Ocorreu um erro...';
    }

    return null;
  }

  Future<String?> findAll(AppDatabase appDatabase) async {
    try {
      Response response = await _dio.get(CloudEndpoints.listin);

      if (response.data != null) {
        Map<String, dynamic> map = {};

        map['listins'] = response.data;

        await LocalDataHandler().mapToLocalData(
          map: map,
          appdatabase: appDatabase,
        );
      } else {
        return 'Não foi possível sincronizar (dados vazios)...';
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        return e.response!.data!.toString();
      } else {
        return e.message;
      }
    } on Exception catch (_) {
      return 'Ocorreu um erro...';
    }

    return null;
  }

  Future<String?> clear() async {
    try {
      await _dio.delete(CloudEndpoints.listin);
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        return e.response!.data!.toString();
      } else {
        return e.message;
      }
    } on Exception catch (_) {
      return 'Ocorreu um erro...';
    }

    return null;
  }
}
