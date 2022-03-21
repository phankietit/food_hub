import 'package:food_hub/controllers/count_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountController>(() => CountController());
    // Get.put<Service>(() => Api());
  }
}
