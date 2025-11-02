import 'index.dart';
import 'package:http/http.dart' as http;

class NetworkRequester {
  late Dio _dio;

  NetworkRequester._privateConstructor() {
    prepareRequest();
  }

  NetworkRequester._publicRequest() {
    preparePublicRequest();
  }

  NetworkRequester._authenticatedRequest() {
    prepareAuthenticatedRequest();
  }

  NetworkRequester._rawRequest() {
    prepareRawRequest();
  }

  static final NetworkRequester shared = NetworkRequester._privateConstructor();
  static final NetworkRequester public = NetworkRequester._publicRequest();
  static final NetworkRequester authenticated =
      NetworkRequester._authenticatedRequest();
  static final NetworkRequester raw = NetworkRequester._rawRequest();

  final HardwareInfo? hardwareInfo = locator<HardwareInfo>();

  void prepareRawRequest() {
    _dio = Dio();

    _dio.interceptors.clear();

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio.interceptors.add(ChuckerDioInterceptor());

    _dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: _printLog,
      ),
    );
    // DioCacheManager(CacheConfig(baseUrl: Env.baseURL)).interceptor;
  }

  void prepareAuthenticatedRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: Timeouts.CONNECT_TIMEOUT),
      receiveTimeout: const Duration(milliseconds: Timeouts.RECEIVE_TIMEOUT),
      baseUrl: AppURLs.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        'Accept': Headers.jsonContentType,
        'x-device-hash': hardwareInfo?.udid,
        'x-device-client': Platform.isAndroid ? "android" : "ios",
        'x-app-version': hardwareInfo?.buildNumber ?? 0,
        'x-device-lang': hardwareInfo?.lang,
        'timezone': hardwareInfo?.timeZone,
        'Authorization': 'Bearer ${StorageUtils.getToken()}',
      },
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio.interceptors.add(ChuckerDioInterceptor());
    _dio.interceptors.addAll([
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: _printLog,
      ),
      // DioCacheManager(CacheConfig(baseUrl: Env.baseURL)).interceptor
    ]);
  }

  void prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: Timeouts.CONNECT_TIMEOUT),
      receiveTimeout: const Duration(milliseconds: Timeouts.RECEIVE_TIMEOUT),
      baseUrl: AppURLs.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        'Accept': Headers.jsonContentType,
        'x-device-hash': hardwareInfo?.udid,
        'x-device-client': Platform.isAndroid ? "android" : "ios",
        'x-app-version': hardwareInfo?.buildNumber ?? 0,
        'x-device-lang': hardwareInfo?.lang,
        'timezone': hardwareInfo?.timeZone,
      },
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.add(ChuckerDioInterceptor());
    _dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: _printLog,
      ),
    );
    // DioCacheManager(CacheConfig(baseUrl: Env.baseURL)).interceptor;
  }

  void preparePublicRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: Timeouts.CONNECT_TIMEOUT),
      receiveTimeout: const Duration(milliseconds: Timeouts.RECEIVE_TIMEOUT),
      baseUrl: AppURLs.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {'Accept': Headers.jsonContentType},
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.add(ChuckerDioInterceptor());
    _dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: _printLog,
      ),
    );
    // DioCacheManager(CacheConfig(baseUrl: Env.baseURL)).interceptor;
  }

  _printLog(Object object) => log(object.toString());

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return APIExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: query,
        data: data,
      );
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return APIExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.put(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return APIExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        queryParameters: query,
        data: data,
      );
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return APIExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: query,
        data: data,
      );
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return APIExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> uploadFile({
    required String path,
    Map<String, dynamic>? query,
    required bool isImage,
    required File file,
    required Function(int count, int total) progressCallback,
  }) async {
    final asset = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
        contentType: isImage
            ? MediaType('image', 'jpeg')
            : MediaType('application', 'pdf'),
      ),
    });
    try {
      final response = await _dio.put(
        path,
        queryParameters: query,
        data: asset,
        onSendProgress: (count, total) => progressCallback(count, total),
      );

      http.put(
        Uri.parse(path),
        headers: {
          'Content-Type': isImage ? 'image/jpeg' : 'application/pdf',
          'Accept': "*/*",
          'Content-Length': File(file.path).lengthSync().toString(),
          'Connection': 'keep-alive',
        },
        body: File(file.path).readAsBytesSync(),
      );
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return APIExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> uploadAnyFile({
    required String path,
    Map<String, dynamic>? query,
    required String extension,
    required File file,
    required Function(int count, int total) progressCallback,
  }) async {
    MediaType contentType =
        AppConstants.imageMimeType.contains(extension.toLowerCase())
        ? MediaType('image', extension)
        : (AppConstants.videoMimeType.contains(extension)
              ? MediaType("video", extension)
              : MediaType('application', extension));

    final asset = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
        contentType: contentType,
      ),
    });
    try {
      final response = await _dio.put(
        path,
        queryParameters: query,
        data: asset,
        onSendProgress: (count, total) => progressCallback(count, total),
      );

      http.put(
        Uri.parse(path),
        headers: {
          'Content-Type': "${contentType.type}/${contentType.subtype}",
          'Accept': "*/*",
          'Content-Length': File(file.path).lengthSync().toString(),
          'Connection': 'keep-alive',
        },
        body: File(file.path).readAsBytesSync(),
      );
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return APIExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> download({
    required String urlPath,
    required String savePath,
  }) async {
    try {
      final response = await _dio.download(urlPath, savePath);
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return APIExceptionHandler.handleError(error);
    }
  }
}
