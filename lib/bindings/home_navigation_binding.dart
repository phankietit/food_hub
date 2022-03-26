import 'package:food_hub/bindings/home_binding.dart';
import 'package:food_hub/controllers/home_navigation_controller.dart';
import 'package:get/instance_manager.dart';

class HomeNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeNavigationController>(() => HomeNavigationController());
    HomeBinding().dependencies();
  }
}
