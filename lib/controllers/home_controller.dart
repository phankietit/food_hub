import 'package:food_hub/controllers/base_controller.dart';
import 'package:food_hub/models/category_model.dart';
import 'package:food_hub/routes/links.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class HomeController extends BaseController {
  final List<CategoryModel> _categories = [
    CategoryModel(
      id: "01",
      name: "Burger",
      uri: "assets/images/categories/burger.png",
    ),
    CategoryModel(
      id: "02",
      name: "Donat",
      uri: "assets/images/categories/donat.png",
    ),
    CategoryModel(
      id: "03",
      name: "Pizza",
      uri: "assets/images/categories/pizza.png",
    ),
    CategoryModel(
      id: "04",
      name: "Mexican",
      uri: "assets/images/categories/mexican.png",
    ),
    CategoryModel(
      id: "05",
      name: "Asian",
      uri: "assets/images/categories/asian.png",
    ),
  ];

  final RxString _currentCategoryId = ''.obs;

  String get currentCategoryId => _currentCategoryId.value;
  List<CategoryModel> get categories => _categories;

  void onSelectCategory(String id) async {
    updateLoading(true);
    _currentCategoryId(id);
    await Future.delayed(const Duration(milliseconds: 500));
    updateLoading(false);
  }

  void goToFoodDetail(String id) {
    Get.toNamed(AppLinks.FOOD_DETAIL);
  }

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    _currentCategoryId(_categories.first.id);
    updateLoading(false);
    super.onInit();
  }
}
