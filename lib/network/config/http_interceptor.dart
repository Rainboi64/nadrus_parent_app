import 'package:dio/dio.dart';

import '../../controllers/auth_controller.dart';

class HttpInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final httpHeaders = {
      'Accept': 'application/json',
      'format': 'json',
      'Authorization': 'Bearer ${await AuthenticationController.token()}',
    };
    options.headers.addAll(httpHeaders);
    options.connectTimeout = const Duration(seconds: 60);
    options.receiveTimeout = const Duration(seconds: 60);
    options.sendTimeout = const Duration(seconds: 60);
    //options.baseUrl = Env.baseUrl;
    super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await AuthenticationController.logOut();
    }
    super.onError(err, handler);
  }
}
