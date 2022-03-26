import 'package:food_hub/controllers/home_controller.dart';
import 'package:food_hub/controllers/restaurant_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<RestaurantController>(() => RestaurantController());
  }
}
