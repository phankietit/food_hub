import 'package:get/get.dart';

class AuthService extends GetxService {
  late final isAuthenticated;

  @override
  onInit() {
    isAuthenticated = false;
    return super.onInit();
  }

  updateAuth() {
    isAuthenticated = false;
  }
}
