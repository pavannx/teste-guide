import 'package:flutter/material.dart';
import 'package:test/core/style/app_colors.dart';

class AppButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double width;

  const AppButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 0,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
