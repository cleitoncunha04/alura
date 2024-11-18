import 'dart:developer';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends InterceptorContract {
  Logger logger = Logger();

  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    print('----- Request -----');
    // print(request.toString());
    // print(request.headers.toString());
    logger.t('${request.url}\n${request.headers}\n$request');
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    log('----- Response -----');
    // log('Code: ${response.statusCode}');
    if (response is Response) {
      // log((response).body);
      if (response.statusCode ~/ 100 == 2) {
        logger.i(
            '${response.request!.url}\n${response.statusCode}\n${response.headers}\n${response.body}');
      } else {
        logger.e(
            '${response.request!.url}\n${response.headers}\n${response.body}');
      }
    }
    return response;
  }
}
