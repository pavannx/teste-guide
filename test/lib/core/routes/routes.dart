import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test/core/routes/route_names.dart';
import 'package:test/features/home/presentation/screen/home_screen.dart';
import 'package:test/features/price_variation/presentation/screen/price_variation_screen.dart';
import 'package:test/features/price_variation/price_variation_binder.dart';

class AppRoutes {
  static returnPages() {
    return [
      GetPage(
        name: RouteNames.homeScreen,
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: RouteNames.priceVariationScreen,
        page: () => const PriceVariationScreen(),
        binding: PriceVariationBinder(),
      ),
    ];
  }
}
