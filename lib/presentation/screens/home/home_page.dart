import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/constants/colors.dart';
import 'package:food_hub/constants/radius.dart';
import 'package:food_hub/constants/shadow.dart';
import 'package:food_hub/constants/spacing.dart';
import 'package:food_hub/controllers/home_controller.dart';
import 'package:food_hub/controllers/restaurant_controller.dart';
import 'package:food_hub/models/category_model.dart';
import 'package:food_hub/models/food_model.dart';
import 'package:food_hub/models/restaurant_model.dart';
import 'package:food_hub/presentation/widgets/indicator.dart';
import 'package:food_hub/presentation/widgets/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final RestaurantController _restaurantController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WrapperIndicator(
        loading: controller.isLoading,
        child: Scaffold(
          backgroundColor: AppColors.white100,
          resizeToAvoidBottomInset: true,
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              child: _buildContent(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeaderSearch(),
        SizedBox(height: 30.h),
        _buildCategories(),
        _buildFeaturedRestaurants(context),
        _buildPopularFood(context),
      ],
    );
  }

  Widget _buildFeaturedRestaurants(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.space24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr("featured_restaurant"),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark80,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr("view_all"),
                    style: TextStyle(
                      color: AppColors.orange100,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SvgPicture.asset("assets/icons/arrow_right.svg"),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 258.w,
          child: ListView.builder(
            itemCount: _restaurantController.restaurants.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final RestaurantModel item =
                  _restaurantController.restaurants[index];

              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  boxShadow: AppShadow.buttonWhite,
                  borderRadius: circularRadius(AppRadius.border16),
                ),
                margin: EdgeInsets.only(
                  bottom: AppSpacing.space28,
                  right: index == _restaurantController.restaurants.length - 1
                      ? AppSpacing.space24
                      : 16.w,
                  left: index == 0 ? AppSpacing.space24 : 0,
                ),
                width: 266.w,
                child: Column(
                  children: [
                    _buildItemFeatureImage(item),
                    _buildItemInformation(item),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildItemFeatureImage(RestaurantModel item) {
    return Stack(
      children: [
        Image.asset(
          item.uri,
          width: 266.w,
          height: 136.w,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: AppSpacing.space12,
          right: AppSpacing.space12,
          top: AppSpacing.space12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space8),
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  borderRadius: circularRadius(AppRadius.border32),
                ),
                child: Row(
                  children: [
                    Text(
                      item.rating.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.dark80,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    SvgPicture.asset(
                      "assets/icons/star.svg",
                      width: 10.w,
                      height: 10.w,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      "(${item.totalRating > 25 ? "25+" : item.totalRating})",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 9.sp,
                        color: AppColors.gray100,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () =>
                    _restaurantController.doMakeFavouriteRestaurant(item.id),
                child: Container(
                  width: 28.w,
                  height: 28.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: circularRadius(AppRadius.border32),
                    color: item.favourite
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemInformation(RestaurantModel item) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.space16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              item.name,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/delivery.svg",
                      width: 14.w,
                      height: 14.w,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      item.deliveryFee == 0
                          ? "Free delivery"
                          : "\$${item.deliveryFee}",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.gray100,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 16.w,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/timer.svg",
                      width: 14.w,
                      height: 14.w,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      item.timer,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.gray100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Wrap(
              spacing: AppSpacing.space8,
              children: item.categoryIds.map((item) {
                final categoryItem = controller.categories
                    .firstWhere((element) => element.id == item);
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.gray20,
                    borderRadius: circularRadius(AppRadius.border4),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.space8,
                    vertical: AppSpacing.space4,
                  ),
                  child: Text(
                    categoryItem.name.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.gray100,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPopularFood(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.space24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr("popular_item"),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark80,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr("view_all"),
                    style: TextStyle(
                      color: AppColors.orange100,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SvgPicture.asset("assets/icons/arrow_right.svg"),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 252.w,
          child: ListView.builder(
            itemCount: _restaurantController.popularFoods.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final FoodModel item = _restaurantController.popularFoods[index];

              return Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.only(
                  bottom: AppSpacing.space28,
                  left: index == 0 ? AppSpacing.space24 : 0,
                  right: index == _restaurantController.restaurants.length - 1
                      ? AppSpacing.space24
                      : 16.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  boxShadow: AppShadow.buttonWhite,
                  borderRadius: circularRadius(AppRadius.border16),
                ),
                width: 154.w,
                child: GestureDetector(
                  onTap: () {
                    printInfo(info: "tap");
                    controller.goToFoodDetail(item.id);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPopularItemFeatureImage(item),
                      _buildPopularItemInformation(item),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildPopularItemFeatureImage(FoodModel item) {
    return Stack(
      children: [
        Column(
          children: [
            Image.asset(
              item.uri,
              width: 154.w,
              height: 160.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 14.w),
          ],
        ),
        Positioned(
          left: AppSpacing.space12,
          right: AppSpacing.space12,
          top: AppSpacing.space12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space8),
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  borderRadius: circularRadius(AppRadius.border32),
                ),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "\$",
                        style: TextStyle(
                          color: AppColors.orange100,
                          fontSize: 8.sp,
                        ),
                        children: [
                          TextSpan(
                            text: item.price.toString(),
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w900,
                              color: AppColors.dark80,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => _restaurantController.doMakeFavouriteFood(item.id),
                child: Container(
                  width: 28.w,
                  height: 28.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: circularRadius(AppRadius.border32),
                    color: item.favourite
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
            ],
          ),
        ),
        Positioned(
          left: AppSpacing.space12,
          bottom: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.space8),
                height: 28.w,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  borderRadius: circularRadius(AppRadius.border32),
                  boxShadow: AppShadow.buttonWhite,
                ),
                child: Row(
                  children: [
                    Text(
                      item.rating.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.dark80,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    SvgPicture.asset(
                      "assets/icons/star.svg",
                      width: 10.w,
                      height: 10.w,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      "(${item.totalRating > 25 ? "25+" : item.totalRating})",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 9.sp,
                        color: AppColors.gray100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPopularItemInformation(FoodModel item) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: AppSpacing.space16,
          right: AppSpacing.space16,
          bottom: AppSpacing.space8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              item.name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.dark80,
              ),
            ),
            Text(
              item.description,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.gray100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 128.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final CategoryModel item = controller.categories[index];
          final isSelected = controller.currentCategoryId == item.id;

          return Row(
            children: [
              index == 0
                  ? SizedBox(
                      width: 16.w,
                    )
                  : const SizedBox(),
              GestureDetector(
                onTap: () => controller.onSelectCategory(item.id),
                child: Container(
                  margin: EdgeInsets.only(bottom: AppSpacing.space28),
                  padding: EdgeInsets.all(AppSpacing.space4),
                  width: 60.w,
                  height: 98.w,
                  decoration: BoxDecoration(
                    color:
                        isSelected ? AppColors.orange100 : AppColors.white100,
                    boxShadow: AppShadow.buttonWhite,
                    borderRadius: circularRadius(AppRadius.border32),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        item.uri,
                        width: 52.w,
                        height: 52.w,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(bottom: AppSpacing.space4),
                          // color: Colors.red,
                          child: Text(
                            item.name,
                            maxLines: 1,
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.white100
                                  : AppColors.dark80,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
            ],
          );
        },
        itemCount: controller.categories.length,
      ),
    );
  }

  Widget _buildHeaderSearch() {
    final _borderInput = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppRadius.border12),
      ),
      borderSide: const BorderSide(color: AppColors.gray50, width: 1.0),
    );
    final _borderInputFocus = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppRadius.border12),
      ),
      borderSide: const BorderSide(color: AppColors.orange50, width: 1.0),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32.h,
          ),
          Text(
            tr("what_you_like"),
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.dark80,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 52.w,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.space20,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/search.svg",
                          width: 16.w,
                          height: 16.w,
                        ),
                      ),
                      hintText: tr("find_food_restaurant"),
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.gray100,
                      ),
                      border: _borderInput,
                      enabledBorder: _borderInput,
                      focusedBorder: _borderInputFocus,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 52.w,
                  height: 52.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white100,
                    boxShadow: AppShadow.buttonWhite,
                    borderRadius: circularRadius(AppRadius.border12),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/filter.svg",
                    width: 20.w,
                    height: 20.w,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
