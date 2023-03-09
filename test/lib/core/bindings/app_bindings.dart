import 'package:get/get.dart';
import 'package:test/core/api/api.dart';
import 'package:test/features/home/data/datasource/home_datasource.dart';
import 'package:test/features/home/data/repository/asset_value_repository_implementation.dart';
import 'package:test/features/home/domain/repositories/assets_value_respository.dart';
import 'package:test/features/home/domain/usecases/get_assets_values_usecase.dart';
import 'package:test/features/home/presentation/controller/home_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Api>(ApiImplementation());

    /// [Datasources]
    Get.lazyPut<HomeDatasource>(() => HomeDatasourceImpl());

    /// [Repositories]
    Get.lazyPut<AssetsValueRepository>(
      () => AssetsValueRepositoryImplementation(),
    );

    /// [Use cases]
    Get.lazyPut<GetAssetsValuesUsecase>(() => GetAssetsValuesUsecaseCall());

    /// [Controllers]
    Get.put(HomeController());
  }
}
