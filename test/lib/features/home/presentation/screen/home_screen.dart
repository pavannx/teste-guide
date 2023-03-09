import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/core/routes/route_names.dart';
import 'package:test/core/style/app_colors.dart';
import 'package:test/core/widgets/app_button.dart';
import 'package:test/features/home/presentation/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(
        () => Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButtonWidget(
                      width: 270,
                      title: 'Variação do preço',
                      onPressed: () => controller.goToRoute(
                        route: RouteNames.priceVariationScreen,
                      ),
                    ),
                    AppButtonWidget(
                      width: 270,
                      title: 'Gráfico da variação do preço',
                      onPressed: () => controller.goToRoute(
                        route: RouteNames.priceVariationGraphicScreen,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
