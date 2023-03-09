import 'package:get/get.dart';
import 'package:test/features/home/domain/entities/asset_entity.dart';
import 'package:test/features/home/presentation/controller/home_controller.dart';

class PriceVariationController extends GetxController {
  final _homeController = Get.find<HomeController>();

  List<AssetEntity> assets = [];

  @override
  void onInit() {
    assets = _homeController.assetsList;
    super.onInit();
  }
}
