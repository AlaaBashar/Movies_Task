import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:flutter_skills_task/core/core.export.dart';


abstract class DioNetworkInterface {
  Future<ApiResponse<T>> get<T>(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      });

  Future<ApiResponse<T>> post<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      });

  Future<ApiResponse<T>> delete<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      });

  Future<ApiResponse<T>> put<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      });

  Future<ApiResponse<T>> patch<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      });
}
class DioNetworkInterfaceImpl implements DioNetworkInterface {
  Dio? _dio;
  final bool enableLog;
  final Map<String, dynamic> _headers = {};

  DioNetworkInterfaceImpl({this.enableLog = false}) {
    _dio = Dio();

  }

  @override
  Future<ApiResponse<T>> get<T>(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      }) async {
    ApiResponse<T> apiResponse = ApiResponse<T>();
    try {
      _handleBaseUrl();
      _requestHandler(headers, queryParameters, userToken);

      final Future<Response> getMethod = _dio!.get(
        url,
        options: Options(headers: _headers),
        queryParameters: queryParameters,
      );

      apiResponse = await _networkMethods(method: getMethod);
      return apiResponse;
    }
    on DioError catch (e) {
      apiResponse.statusCode = e.response!.statusCode;
      apiResponse.data = e.response!.data;
      throw apiResponse;
    }
  }

  @override
  Future<ApiResponse<T>> post<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      }) async {
    ApiResponse<T> apiResponse = ApiResponse<T>();
    try {
      _handleBaseUrl();
      _requestHandler(headers, queryParameters, userToken, data: data);
      final Future<Response> postMethod = _dio!.post(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParameters,
      );

      apiResponse = await _networkMethods(method: postMethod);
      return apiResponse;
    } on DioError catch (e) {
      apiResponse.statusCode = e.response!.statusCode;
      apiResponse.data = e.response!.data;
      throw apiResponse;
    }
  }


  @override
  Future<ApiResponse<T>> delete<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      }) async {
    ApiResponse<T> apiResponse = ApiResponse<T>();
    try {
      _handleBaseUrl();
      _requestHandler(headers, queryParameters, userToken, data: data);

      final Future<Response> postMethod = _dio!.delete(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParameters,
      );

      apiResponse = await _networkMethods(method: postMethod);
      return apiResponse;
    } on DioError catch (e) {
      apiResponse.statusCode = e.response!.statusCode;
      apiResponse.data = e.response!.data;
      throw apiResponse;
    }
  }

  @override
  Future<ApiResponse<T>> put<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      }) async {
    ApiResponse<T> apiResponse = ApiResponse<T>();
    try {
      _handleBaseUrl();
      _requestHandler(headers, queryParameters, userToken, data: data);
      final Future<Response> putMethod = _dio!.put(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParameters,
      );

      apiResponse = await _networkMethods(method: putMethod);
      return apiResponse;
    } on DioError catch (e) {
      apiResponse.statusCode = e.response!.statusCode;
      apiResponse.data = e.response!.data;
      throw apiResponse;
    }
  }

  @override
  Future<ApiResponse<T>> patch<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      }) async {
    ApiResponse<T> apiResponse = ApiResponse<T>();
    try {
      _handleBaseUrl();
      _requestHandler(headers, queryParameters, userToken, data: data);
      final Future<Response> patchMethod = _dio!.patch(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParameters,
      );

      apiResponse = await _networkMethods(method: patchMethod);
      return apiResponse;
    } on DioError catch (e) {
      apiResponse.statusCode = e.response!.statusCode;
      apiResponse.data = e.response!.data;
      throw apiResponse;
    }
  }

  Future<ApiResponse<T>> _networkMethods<T>({
    required Future<Response> method,
  }) async {
    ApiResponse<T> apiResponse = ApiResponse<T>();
    try {
      // set the response of method [get, post, put, patch, delete] to response.
      final response = await method;
      apiResponse.statusCode = response.statusCode;
      apiResponse.data = response.data;
      if (enableLog) _networkLog(response);

      return apiResponse;
    } on DioError catch (e) {
      _traceError(e);
      apiResponse.statusCode = e.response!.statusCode;
      apiResponse.data = e.response!.data;
      throw apiResponse;
    }
  }


  void _requestHandler(
      Map<String, dynamic>? headers,
      Map? params,
      String? userToken, {
        String? data,
      }) {
    data ??= "";
    if (headers != null) _headers.addAll(headers);
    params ??= {"": ""};
    if (userToken != null) _headers.addAll({"x-access-token": userToken});
  }


  void _handleBaseUrl() {
    _dio!.options.baseUrl = 'https://api.themoviedb.org/3/';
    _dio!.options.queryParameters = {"api_key":NetworkLinks.apiKey};
  }


  void _traceError(DioError e) =>
      developer.log('________________________________________ \n'
          '- Dio [ERROR] info ==> \n'
          '- ENVIROMENT: \n'
          '- BASE_URL: ${e.requestOptions.baseUrl}\n'
          '- PATH: ${e.requestOptions.path}\n'
          '- Method: ${e.requestOptions.method}\n'
          '- Params: ${e.requestOptions.queryParameters}\n'
          '- Body: ${e.requestOptions.data}\n'
          '- Header: ${e.requestOptions.headers}\n'
          '- statusCode: ${e.response!.statusCode}\n'
          '- RESPONSE: ${e.response!.data} \n'
          '- stackTrace: ${e.stackTrace} \n'
          '- [END] ________________________________________');

  void _networkLog(Response response) =>
      developer.log('________________________________________\n'
          '- Dio [RESPONSE] info ==> \n'
          '- ENVIROMENT: \n'
          '- BASE_URL: ${response.requestOptions.baseUrl}\n'
          '- PATH: ${response.requestOptions.path}\n'
          '- Method: ${response.requestOptions.method}\n'
          '- Params: ${response.requestOptions.queryParameters}\n'
          '- Body: ${response.requestOptions.data}\n'
          '- Header: ${response.requestOptions.headers}\n'
          '- statusCode: ${response.statusCode}\n'
          '- RESPONSE: ${response.data} \n'
          '- [END] ________________________________________');



}
