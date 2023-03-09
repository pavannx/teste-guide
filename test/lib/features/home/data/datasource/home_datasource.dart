import 'dart:convert';

import 'package:get/instance_manager.dart';
import 'package:test/core/api/api.dart';
import 'package:test/features/home/data/models/assets_value_response_model.dart';

abstract class HomeDatasource {
  Future<AssetsValueResponseModel> getAssetValue({
    required int timestamp1,
    required int timestamp2,
  });
}

class HomeDatasourceImpl implements HomeDatasource {
  final _api = Get.find<Api>();

  Future<AssetsValueResponseModel> getAssetValue({
    required int timestamp1,
    required int timestamp2,
  }) async {
    try {
      final queryParameters = {
        'period1': timestamp1.toString(),
        'period2': timestamp2.toString(),
        'interval': '1d'
      };

      final response = await _api.get(queryParameters: queryParameters);

      return AssetsValueResponseModel.fromJson(jsonDecode(response.toString()));
    } catch (e) {
      throw Exception(e);
    }
  }
}
