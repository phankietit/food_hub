// ignore_for_file: prefer_typing_uninitialized_variables

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
