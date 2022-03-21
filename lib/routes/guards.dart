import 'package:food_hub/routes/links.dart';
import 'package:food_hub/services/auth_service.dart';
import 'package:food_hub/services/authorization_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (authService.isAuthenticated) {
      return const RouteSettings(name: AppLinks.HOME);
    }

    return const RouteSettings(name: AppLinks.HOME);
  }
}

class AuthorizationGuard extends GetMiddleware {
  final authzGuard = Get.find<AuthorizationService>();

  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    if (authzGuard.isManager) {
      return const RouteSettings(name: AppLinks.HOME);
    }
    return super.redirect(route);
  }
}
