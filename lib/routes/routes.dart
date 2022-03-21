import 'package:food_hub/bindings/home_binding.dart';
import 'package:food_hub/bindings/welcome_binding.dart';
import 'package:food_hub/presentation/screens/welcome/welcome_page.dart';
import 'package:get/get.dart';

import 'links.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppLinks.WELCOME,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    // GetPage(
    //   name: AppLinks.DASHBOARD,
    //   page: () => Dashboard(),
    //   middlewares: [
    //     AuthGuard(),
    //   ],
    //   children: [
    //     GetPage(
    //       name: AppLinks.PRODUCTS,
    //       page: () => Products(),
    //     ),
    //     GetPage(
    //       name: AppLinks.FAVORITES,
    //       page: () => Favorites(),
    //     ),
    //     GetPage(
    //       name: AppLinks.ORDERS,
    //       page: () => Orders(),
    //     ),
    //   ],
    // ),
    // GetPage(
    //   name: AppLinks.ADMIN,
    //   page: () => AdminDashboard(),
    //   middlewares: [
    //     // Allow only admins to get through
    //     AuthGuard(),
    //     AuthorizationGuard()
    //   ],
    // )
  ];
}
