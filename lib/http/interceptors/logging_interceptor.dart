import 'package:flutter/cupertino.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint('Request');
    debugPrint('url: ${data.url}');
    debugPrint('headers ${data.headers}');
    debugPrint('headers ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint('Response');
    debugPrint('url: ${data.statusCode}');
    debugPrint('headers ${data.headers}');
    debugPrint('headers ${data.body}');
    return data;
  }
}