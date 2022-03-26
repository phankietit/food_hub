import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/constants/colors.dart';
import 'package:food_hub/constants/radius.dart';
import 'package:food_hub/constants/shadow.dart';
import 'package:food_hub/constants/spacing.dart';
import 'package:food_hub/controllers/welcome_controller.dart';
import 'package:food_hub/presentation/widgets/indicator.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBackground());
  }

  Widget _buildBackground() {
    return Obx(() => WrapperIndicator(
          loading: controller.loading,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcome_background.png"),
                fit: BoxFit.cover,
                alignment: Alignment.bottomLeft,
              ),
            ),
            child: SafeArea(
              child: _buildContent(),
            ),
          ),
        ));
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space28,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSkip(),
          _buildMessage(),
          SizedBox(
            height: 110.h,
          ),
          _buildSigninMethod(),
        ],
      ),
    );
  }

  Widget _buildSigninMethod() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 84.w,
              child: const Divider(
                color: AppColors.white100,
                thickness: 1,
              ),
            ),
            Text(
              tr("sign_in_with"),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white100,
              ),
            ),
            SizedBox(
              width: 84.w,
              child: const Divider(
                color: AppColors.white100,
                thickness: 1,
              ),
            )
          ],
        ),
        SizedBox(
          height: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: controller.goToHome,
              child: Container(
                width: 140.w,
                height: 54.w,
                padding: EdgeInsets.only(
                  left: AppSpacing.space12,
                  right: AppSpacing.space16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppRadius.border28),
                  ),
                  boxShadow: AppShadow.button,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/facebook_circle.svg",
                      width: 30.w,
                      height: 30.w,
                    ),
                    Expanded(
                      child: Center(child: Text(tr("facebook").toUpperCase())),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.goToHome,
              child: Container(
                width: 140.w,
                height: 54.w,
                padding: EdgeInsets.only(
                  left: AppSpacing.space12,
                  right: AppSpacing.space16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppRadius.border28),
                  ),
                  boxShadow: AppShadow.button,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/google_circle.svg",
                      width: 30.w,
                      height: 30.w,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(tr("google").toUpperCase()),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        GestureDetector(
          onTap: controller.goToHome,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 54.w,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(AppRadius.border28)),
              border: Border.all(
                color: AppColors.white100,
                width: 2,
              ),
              boxShadow: AppShadow.button,
              color: AppColors.white21,
            ),
            child: Text(
              tr("start_with_mail_phone"),
              style: TextStyle(
                color: AppColors.white100,
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        RichText(
          text: TextSpan(
            text: tr("have_account"),
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16.sp,
            ),
            children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = controller.goToHome,
                  text: tr("sign_in"),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMessage() {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tr("welcome1"),
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            tr("welcome2"),
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w900,
              color: AppColors.orange100,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 52.w),
            child: Text(
              tr("welcome3"),
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.dark50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkip() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: controller.goToHome,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.space16,
              vertical: AppSpacing.space8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(AppRadius.border28),
              ),
              color: AppColors.white100,
              boxShadow: AppShadow.button,
            ),
            child: Text(
              tr("skip"),
              style: TextStyle(
                color: AppColors.orange100,
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
              ),
            ),
          ),
        )
      ],
    );
  }
}
