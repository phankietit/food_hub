import 'package:food_hub/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.r,
      width: 50.r,
      child: const LoadingIndicator(
        indicatorType: Indicator.ballRotateChase,
        colors: AppColors.indicators,
        strokeWidth: 3,
        backgroundColor: Colors.transparent,
        pathBackgroundColor: Colors.black,
      ),
    );
  }
}

class ContainerIndicator extends StatelessWidget {
  const ContainerIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1,
      child: AppIndicator(),
    );
  }
}
