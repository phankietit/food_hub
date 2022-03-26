import 'package:food_hub/controllers/authen_controller.dart';
import 'package:get/get.dart';

class AuthenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenController>(() => AuthenController());
  }
}
