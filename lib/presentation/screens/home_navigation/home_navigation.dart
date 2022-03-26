import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/controllers/authen_controller.dart';
import 'package:food_hub/routes/links.dart';
import 'package:get/get.dart';

import 'package:food_hub/constants/colors.dart';
import 'package:food_hub/constants/radius.dart';
import 'package:food_hub/constants/shadow.dart';
import 'package:food_hub/constants/spacing.dart';
import 'package:food_hub/controllers/home_navigation_controller.dart';
import 'package:food_hub/models/home_navigation_model.dart';
import 'package:food_hub/presentation/widgets/material.dart';

class HomeNavigationPage extends GetView<HomeNavigationController> {
  HomeNavigationPage({Key? key}) : super(key: key);

  final AuthenController _authenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        key: controller.key,
        appBar: _buildAppBar(),
        drawer: _buildDrawer(),
        bottomNavigationBar: BottomTabBar(
          pages: controller.pages,
          onItemTapped: controller.onItemTapped,
          selectedIndex: controller.selectedIndex,
        ),
        backgroundColor: AppColors.white100,
        body: controller.pages[controller.selectedIndex].page,
      );
    });
  }

  Widget _buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.space24,
            vertical: AppSpacing.space32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: AppSpacing.space4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: circularRadius(90.w / 2),
                        boxShadow: AppShadow.button,
                        color: AppColors.white100,
                      ),
                      child: Image.asset(
                        "assets/images/user_avatar.png",
                        width: 90.w,
                        height: 90.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Farion Wick",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.dark80,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "farionwick@gmail.com",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.gray100,
                      ),
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      const DrawerItem(
                        icon: "assets/icons/my_order.svg",
                        label: "My Orders",
                      ),
                      const DrawerItem(
                        icon: "assets/icons/person.svg",
                        label: "My Profile",
                      ),
                      const DrawerItem(
                        icon: "assets/icons/location.svg",
                        label: "Delivery Address",
                      ),
                      const DrawerItem(
                        icon: "assets/icons/wallet.svg",
                        label: "Payment Methods",
                      ),
                      const DrawerItem(
                        icon: "assets/icons/mail.svg",
                        label: "Contact Us",
                      ),
                      const DrawerItem(
                        icon: "assets/icons/setting.svg",
                        label: "Settings",
                      ),
                      const DrawerItem(
                        icon: "assets/icons/faq.svg",
                        label: "Helps & FAQs",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              GestureDetector(
                onTap: _authenController.logOut,
                child: Container(
                  margin: EdgeInsets.only(top: AppSpacing.space4),
                  padding: EdgeInsets.fromLTRB(
                    AppSpacing.space12,
                    AppSpacing.space12,
                    AppSpacing.space16,
                    AppSpacing.space12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: circularRadius(AppRadius.border32),
                    boxShadow: AppShadow.buttonWhite,
                    color: AppColors.orange100,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/power.svg",
                        width: 26.w,
                        height: 26.w,
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        tr("log_out"),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColors.white100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.h), // Set this height
      child: SafeArea(
        child: Container(
          height: double.infinity,
          color: Colors.transparent,
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => controller.key.currentState?.openDrawer(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.space28,
                  ),
                  child: Container(
                    width: 38.w,
                    height: 38.w,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      "assets/icons/drawer_menu.svg",
                      width: 12.w,
                      height: 6.w,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: AppShadow.buttonWhite,
                      color: AppColors.white100,
                      borderRadius: circularRadius(AppRadius.border12),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tr("deliver_to"),
                          style: TextStyle(
                            color: AppColors.gray100,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        SvgPicture.asset("assets/icons/arrow_down.svg"),
                      ],
                    ),
                    Text(
                      "4102  Pretty View Lane",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.orange100,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.space28,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppRadius.border12),
                  ),
                  child: Image.asset(
                    "assets/images/user_avatar.png",
                    width: 38.w,
                    height: 38.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomTabBar extends GetView {
  final List<HomeNavigationModel> pages;
  final int selectedIndex;
  final Function(int index) onItemTapped;

  const BottomTabBar({
    Key? key,
    required this.pages,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: AppSpacing.space12),
      decoration: const BoxDecoration(
        boxShadow: AppShadow.bottomTab,
        color: AppColors.white100,
      ),
      // padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: BottomNavigationBar(
        currentIndex: selectedIndex, //New
        onTap: onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: pages
            .asMap()
            .entries
            .map(
              (entries) => BottomNavigationBarItem(
                icon: TabBarIcon(
                  entries.value.icon,
                  active: entries.key == selectedIndex,
                ),
                label: '',
              ),
            )
            .toList(),
      ),
    );
  }
}

class TabBarIcon extends StatelessWidget {
  final String path;
  final bool active;
  final Color activeColor;
  final Color inactiveColor;
  const TabBarIcon(
    this.path, {
    Key? key,
    required this.active,
    this.activeColor = AppColors.orange100,
    this.inactiveColor = AppColors.gray50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.w,
      height: 24.w,
      child: SvgPicture.asset(
        path,
        width: 24.w,
        height: 24.w,
        color: active ? activeColor : inactiveColor,
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final void Function()? onTap;
  final String icon;
  final String label;
  const DrawerItem({
    Key? key,
    this.onTap,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.space32),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 20.w,
              height: 20.w,
            ),
            SizedBox(width: 12.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.dark80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
