import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/constants/colors.dart';
import 'package:food_hub/constants/radius.dart';
import 'package:food_hub/constants/shadow.dart';
import 'package:food_hub/constants/spacing.dart';
import 'package:food_hub/controllers/food_detail_controller.dart';
import 'package:food_hub/presentation/widgets/material.dart';
import 'package:get/get.dart';

class FoodDetailPage extends GetView<FoodDetailController> {
  const FoodDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      bottomNavigationBar: _buildBottom(),
      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildContent(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SafeArea(
      child: Container(
          alignment: Alignment.center,
          height: 58.h,
          padding: EdgeInsets.only(top: AppSpacing.space8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.space8,
                  AppSpacing.space8,
                  AppSpacing.space16,
                  AppSpacing.space8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.orange100,
                  boxShadow: AppShadow.buttonWhite,
                  borderRadius: circularRadius(AppRadius.border32),
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: AppColors.white100,
                        borderRadius: circularRadius(AppRadius.border20),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/lock.svg",
                        width: 18.w,
                        height: 18.w,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      tr("add_to_cart").toUpperCase(),
                      style: TextStyle(
                        color: AppColors.white100,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.space24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildReview(),
          SizedBox(height: 16.h),
          _buildQuantity(),
          SizedBox(height: 22.h),
          Text(
            controller.food.description,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.gray100,
            ),
          ),
          SizedBox(height: 22.h),
          _buildAddOn(),
        ],
      ),
    );
  }

  Widget _buildAddOn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr("food_add_on"),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.dark80,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Obx(
          () => Column(
            children: controller.food.addOns
                .map(
                  (addOn) => GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              addOn.uri,
                              width: 40.w,
                              height: 40.w,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              addOn.name,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.dark80,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "+\$${addOn.price}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.dark80,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Checkbox(
                              onChanged: (value) {
                                controller.doCheckAddOn(addOn.id);
                              },
                              checkColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppRadius.border4),
                              ),
                              fillColor: MaterialStateProperty.resolveWith(
                                  (Set<MaterialState> states) {
                                const Set<MaterialState> interactiveStates =
                                    <MaterialState>{
                                  MaterialState.pressed,
                                  MaterialState.hovered,
                                  MaterialState.focused,
                                };
                                if (states.any(interactiveStates.contains)) {
                                  return AppColors.orange100;
                                }
                                return AppColors.orange100;
                              }),
                              value: controller.addOnIds.contains(addOn.id),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  Widget _buildQuantity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: "\$",
            style: TextStyle(
              color: AppColors.orange100,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(
                text: controller.food.price.toString(),
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: controller.doDecrease,
              child: Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  borderRadius: circularRadius(AppRadius.border32),
                  border: Border.all(
                    color: AppColors.orange100,
                  ),
                ),
                child: Icon(
                  Icons.remove,
                  color: AppColors.orange100,
                  size: 16.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.space8),
              child: Obx(
                () => Text(
                  controller.quantity.toString(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.doIncrease,
              child: Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  borderRadius: circularRadius(AppRadius.border32),
                  border: Border.all(
                    color: AppColors.orange100,
                  ),
                  color: AppColors.orange100,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.white100,
                  size: 16.w,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildReview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 4.w),
        SvgPicture.asset(
          "assets/icons/star.svg",
          width: 18.w,
          height: 18.w,
        ),
        SizedBox(width: 8.w),
        Text(
          controller.food.rating.toString(),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.dark80,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          "(${controller.food.totalRating > 25 ? "25+" : controller.food.totalRating})",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14.sp,
            color: AppColors.gray100,
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          tr("see_review"),
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 13.sp,
            color: AppColors.orange100,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 228.w + MediaQuery.of(context).viewPadding.top,
      backgroundColor: AppColors.white100,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        expandedTitleScale: 1.4,
        titlePadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.space24,
          vertical: AppSpacing.space12,
        ),
        centerTitle: false,
        title: Text(
          controller.food.name,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.dark80,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        background: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top,
          ),
          alignment: Alignment.topCenter,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppRadius.border16,
                  ),
                ),
                child: Image.asset(
                  "assets/images/restaurants/mc_donald.png",
                  width: 323.w,
                  height: 206.w,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.w,
                left: 8.w,
                right: 8.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 38.w,
                        height: 38.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.white100,
                          borderRadius: circularRadius(AppRadius.border12),
                          boxShadow: AppShadow.buttonWhite,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 14.w,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.doMakeFavourite,
                      child: Obx(
                        () => Container(
                          width: 28.w,
                          height: 28.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: circularRadius(AppRadius.border32),
                            color: controller.food.favourite
                                ? AppColors.orange100
                                : AppColors.white21,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/heart_circle.svg",
                            width: 14.w,
                            height: 14.w,
                            color: AppColors.white100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
