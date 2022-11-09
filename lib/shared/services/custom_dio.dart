import 'package:dio/native_imp.dart';
import 'package:flutter_api_rest/shared/services/interceptors/followers_interceptor.dart';
import 'package:flutter_api_rest/shared/services/interceptors/log_interceptor.dart';
import 'package:flutter_api_rest/shared/services/interceptors/post_interceptor.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = "https://jsonplaceholder.typicode.com";
    interceptors.add(LogInterceptor());
    interceptors.add(PostInterceptor());
    interceptors.add(FollowersInterceptor());
  }
}
