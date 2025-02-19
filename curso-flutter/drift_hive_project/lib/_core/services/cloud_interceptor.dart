import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_listin/_core/constants/cloud_endpoints.dart';
import 'package:logger/logger.dart';

class CloudInterceptor extends Interceptor {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      printEmojis: false,
    ),
  );

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: CloudEndpoints.hBaseUrl,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String log = 'Requisição\n'
        'Timestamp: ${DateTime.now()}\n'
        'URI: ${options.uri}\n'
        'Método: ${options.method}\n'
        'Headers: ${JsonEncoder.withIndent('    ').convert(options.headers)}\n'
        '${options.data != null ? 'Body: ${JsonEncoder.withIndent('    ').convert(
            json.decode(options.data),
          )}' : ''}';

    _logger.i(log);

    _dio.post(
      CloudEndpoints.logs,
      data: {
        "request": log,
      },
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String body = response.data != null
        ? 'Body: ${JsonEncoder.withIndent('    ').convert(response.data)}'
        : '';

    String log =
        'Resposta\nTimestamp: ${DateTime.now()}\nMétodo: ${response.requestOptions.method}\nURI: ${response.realUri}\nHeaders: ${JsonEncoder.withIndent('    ').convert(response.headers.map)}\n$body';

    _logger.i(log);

    _dio.post(
      CloudEndpoints.logs,
      data: {
        'response': log,
      },
    );

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String log =
        'Erro\nTimestamp: ${DateTime.now()}\nMétodo: ${err.requestOptions.method}\nURI: ${err.requestOptions.uri}\nHeaders: ${JsonEncoder.withIndent('    ').convert(err.requestOptions.headers)}\nMensagem: ${err.message}\nCódigo: ${err.response?.statusCode}';

    _logger.e(log);

    _dio.post(
      CloudEndpoints.logs,
      data: {
        'error': log,
      },
    );

    super.onError(err, handler);
  }
}
