import 'package:get/instance_manager.dart';
import 'package:test/features/home/domain/entities/asset_entity.dart';
import 'package:test/features/home/domain/repositories/assets_value_respository.dart';

abstract class GetAssetsValuesUsecase {
  Future<List<AssetEntity>> call();
}

class GetAssetsValuesUsecaseCall implements GetAssetsValuesUsecase {
  final _repository = Get.find<AssetsValueRepository>();

  @override
  Future<List<AssetEntity>> call() async {
    int todaysTimestamp =
        (DateTime.now().millisecondsSinceEpoch / 1000).round();

    int dayBeforeTimestamp = ((DateTime.now()
                .subtract(const Duration(days: 45))
                .millisecondsSinceEpoch) /
            1000)
        .round();

    return await _repository.getAssetsValue(
      timestamp1: dayBeforeTimestamp,
      timestamp2: todaysTimestamp,
    );
  }
}
