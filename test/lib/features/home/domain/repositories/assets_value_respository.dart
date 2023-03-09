import 'package:test/features/home/domain/entities/asset_entity.dart';

abstract class AssetsValueRepository {
  Future<List<AssetEntity>> getAssetsValue({
    required int timestamp1,
    required int timestamp2,
  });
}
