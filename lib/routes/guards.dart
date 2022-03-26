import 'package:food_hub/controllers/authen_controller.dart';
import 'package:food_hub/routes/links.dart';
import 'package:food_hub/services/authorization_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthGuard extends GetMiddleware {
  final authController = Get.find<AuthenController>();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (authController.isAuthenticated && route != AppLinks.HOME_NAVIGATION) {
      return const RouteSettings(name: AppLinks.HOME_NAVIGATION);
    } else if (!authController.isAuthenticated && route != AppLinks.WELCOME) {
      return const RouteSettings(name: AppLinks.WELCOME);
    }
    return super.redirect(route);
  }
}

class AuthorizationGuard extends GetMiddleware {
  final authzGuard = Get.find<AuthorizationService>();

  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    if (authzGuard.isManager) {
      return const RouteSettings(name: AppLinks.HOME_NAVIGATION);
    }
    return super.redirect(route);
  }
}
