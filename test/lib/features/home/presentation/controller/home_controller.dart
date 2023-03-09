import 'package:get/get.dart';
import 'package:test/features/home/domain/entities/asset_entity.dart';
import 'package:test/features/home/domain/usecases/get_assets_values_usecase.dart';

class HomeController extends GetxController {
  final _getAssetsValueUsecase = Get.find<GetAssetsValuesUsecase>();

  RxBool isLoading = true.obs;
  List<AssetEntity> assetsList = [];

  void getAssetsData() async {
    var response = await _getAssetsValueUsecase();

    assetsList = response;

    isLoading.value = false;
  }

  void goToRoute({required String route}) => Get.toNamed(route);

  @override
  void onInit() {
    getAssetsData();
    super.onInit();
  }
}
