import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/core/style/app_colors.dart';
import 'package:test/features/home/domain/entities/asset_entity.dart';
import 'package:test/features/price_variation/presentation/controller/price_variation_controller.dart';

class PriceVariationScreen extends StatefulWidget {
  const PriceVariationScreen({super.key});

  @override
  State<PriceVariationScreen> createState() => _PriceVariationScreenState();
}

class _PriceVariationScreenState extends State<PriceVariationScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PriceVariationController>();

    TextStyle styleText = TextStyle(
      color: AppColors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'Variação do preço'.toUpperCase(),
          style: TextStyle(
            color: AppColors.backgroundColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.backgroundColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _HeaderRowComponente(
                styleText: styleText,
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return _ItemComponent(
                    styleText: styleText,
                    entity: controller.assets[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderRowComponente extends StatelessWidget {
  const _HeaderRowComponente({
    Key? key,
    required this.styleText,
  }) : super(key: key);

  final TextStyle styleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DATA',
            style: styleText,
          ),
          Text(
            'VALOR',
            style: styleText,
          ),
          Text(
            'VAR. D1',
            style: styleText,
          ),
          Text(
            '1° DATA',
            style: styleText,
          ),
        ],
      ),
    );
  }
}

class _ItemComponent extends StatelessWidget {
  const _ItemComponent({
    Key? key,
    required this.entity,
    required this.styleText,
  }) : super(key: key);

  final AssetEntity entity;
  final TextStyle styleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getDateString(
              entity.date,
            ),
            style: styleText,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            entity.value.toStringAsFixed(2),
            style: styleText,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            getVariationString(entity.variationFromLastDay),
            style: styleText,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            getVariationString(entity.variationFromDayOne),
            style: styleText,
          ),
        ],
      ),
    );
  }

  String getVariationString(double? variation) {
    return variation == null ? '--------' : '${variation.toStringAsFixed(2)}%';
  }

  String getDateString(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
