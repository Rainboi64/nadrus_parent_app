import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'http_interceptor.dart';
import 'logging_interceptor.dart';

/// Config Http Options
Future<void> httpConfig() async {
  await _httpClientConfig();
}

/// Config Http globally
///
/// Add "Authorization" in header to every request sent,
///
/// Add Log on console for see (Request/Response) details.
_httpClientConfig() {
  final dio = Dio()
    ..transformer = BackgroundTransformer()
    ..interceptors.addAll([
      HttpInterceptor(),
      LoggingInterceptor(),
    ]);
  GetIt.I.registerSingleton<Dio>(dio);
}
