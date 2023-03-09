import 'package:get/get.dart';
import 'package:test/features/price_variation/presentation/controller/price_variation_controller.dart';

class PriceVariationBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(PriceVariationController());
  }
}
