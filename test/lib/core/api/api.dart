import 'package:dio/dio.dart';

abstract class Api {
  Future<dynamic> get({
    required Map<String, dynamic> queryParameters,
  });
}

class ApiImplementation extends Api {
  late final Dio dio;

  ApiImplementation() {
    dio = Dio()
      ..options.baseUrl = 'https://query2.finance.yahoo.com/v8/finance/chart/';
  }

  @override
  Future get({required Map<String, dynamic> queryParameters}) async {
    try {
      return dio.get(
        'PETR4.SA',
        queryParameters: queryParameters,
      );
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
