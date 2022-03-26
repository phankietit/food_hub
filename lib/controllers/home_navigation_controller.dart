import 'package:flutter/material.dart';
import 'package:food_hub/models/home_navigation_model.dart';
import 'package:food_hub/presentation/screens/home/home_page.dart';
import 'package:get/get.dart';

class HomeNavigationController extends GetxController {
  final RxList<HomeNavigationModel> _pages = [
    HomeNavigationModel(
      icon: "assets/icons/home_tab.svg",
      page: HomePage(),
    ),
    HomeNavigationModel(
      icon: "assets/icons/location_tab.svg",
      page: Container(),
    ),
    HomeNavigationModel(
      icon: "assets/icons/cart_tab.svg",
      page: Container(),
    ),
    HomeNavigationModel(
      icon: "assets/icons/favourite_tab.svg",
      page: Container(),
    ),
    HomeNavigationModel(
      icon: "assets/icons/notification_tab.svg",
      page: Container(),
    ),
  ].obs;
  GlobalKey<ScaffoldState> key = GlobalKey();

  final RxInt _selectedIndex = 0.obs;

  void onItemTapped(int index) {
    _selectedIndex(index);
    update();
  }

  RxList<HomeNavigationModel> get pages => _pages;
  int get selectedIndex => _selectedIndex.value;
}
