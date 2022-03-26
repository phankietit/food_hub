import 'package:food_hub/bindings/food_detail_binding.dart';
import 'package:food_hub/bindings/home_binding.dart';
import 'package:food_hub/bindings/home_navigation_binding.dart';
import 'package:food_hub/bindings/welcome_binding.dart';
import 'package:food_hub/presentation/screens/food_detail/food_detail_page.dart';
import 'package:food_hub/presentation/screens/home/home_page.dart';
import 'package:food_hub/presentation/screens/home_navigation/home_navigation.dart';
import 'package:food_hub/presentation/screens/welcome/welcome_page.dart';
import 'package:food_hub/routes/guards.dart';
import 'package:get/get.dart';

import 'links.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppLinks.WELCOME,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [AuthGuard()],
    ),
    GetPage(
      name: AppLinks.HOME_NAVIGATION,
      page: () => HomeNavigationPage(),
      binding: HomeNavigationBinding(),
      middlewares: [AuthGuard()],
    ),
    GetPage(
      name: AppLinks.FOOD_DETAIL,
      page: () => FoodDetailPage(),
      binding: FoodDetailBinding(),
    )
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
