import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import '../../core/constants/api_endpoints.dart';
import '../../app/routes/app_routes.dart';

class ApiClient {
  static ApiClient? _instance;
  late final dio.Dio _dio;
  final _box = GetStorage();

  ApiClient._internal() {
    _dio = dio.Dio(dio.BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ));
    _dio.interceptors.add(dio.InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = _box.read('access_token');
        if (token != null) options.headers['Authorization'] = 'Bearer $token';
        handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          _box.remove('access_token');
          _box.remove('user');
          Get.offAllNamed(AppRoutes.login);
        }
        handler.next(error);
      },
    ));
  }

  static ApiClient get instance {
    _instance ??= ApiClient._internal();
    return _instance!;
  }

  Future<dio.Response> get(String path, {Map<String, dynamic>? params}) =>
      _dio.get(path, queryParameters: params);
  Future<dio.Response> post(String path, {dynamic data}) => _dio.post(path, data: data);
  Future<dio.Response> put(String path, {dynamic data}) => _dio.put(path, data: data);
  Future<dio.Response> patch(String path, {dynamic data}) => _dio.patch(path, data: data);
  Future<dio.Response> delete(String path) => _dio.delete(path);
  Future<dio.Response> upload(String path, dio.FormData form) => _dio.post(path, data: form);
}