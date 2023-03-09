import 'package:get/get.dart';
import 'package:test/features/home/data/datasource/home_datasource.dart';
import 'package:test/features/home/domain/entities/asset_entity.dart';
import 'package:test/features/home/domain/repositories/assets_value_respository.dart';

class AssetsValueRepositoryImplementation implements AssetsValueRepository {
  final _datasource = Get.find<HomeDatasource>();

  @override
  Future<List<AssetEntity>> getAssetsValue({
    required int timestamp1,
    required int timestamp2,
  }) async {
    try {

      final result = await _datasource.getAssetValue(
        timestamp1: timestamp1,
        timestamp2: timestamp2,
      );

      return result.assets;
    } catch (e) {
      throw Exception(e);
      //TODO: tratar erro;
    }
  }
}
