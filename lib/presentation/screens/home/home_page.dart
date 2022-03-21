import 'package:food_hub/constants/colors.dart';
import 'package:food_hub/controllers/count_controller.dart';
import 'package:food_hub/presentation/widgets/indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends GetView<CountController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            controller.obx(
              (state) => Center(
                child: Text(
                  "Count: ${state.toString()}",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.text,
                  ),
                ),
              ),
              onLoading: const AppIndicator(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: controller.decrease,
                  child: Text(
                    "Decrease",
                    style: TextStyle(fontSize: 25.sp),
                  ),
                ),
                TextButton(
                  onPressed: controller.increase,
                  child: Text(
                    "Increase",
                    style: TextStyle(fontSize: 25.sp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
