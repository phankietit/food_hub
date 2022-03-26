import 'package:food_hub/controllers/base_controller.dart';
import 'package:food_hub/models/food_model.dart';
import 'package:get/state_manager.dart';

class FoodDetailController extends BaseController {
  final Rx<FoodDetailModel> _food = FoodDetailModel(
    id: "01",
    favourite: true,
    name: "Ground Beef Tacos",
    rating: 4.5,
    totalRating: 30,
    uri: "assets/images/restaurants/mc_donald.png",
    description:
        "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder.",
    price: 5.50,
    addOns: const [
      FoodAddOnModel(
        id: "01",
        name: "Pepper Julienned",
        price: 2.3,
        uri: "assets/images/pepper_addon.png",
      ),
      FoodAddOnModel(
        id: "02",
        name: "Pepper Julienned",
        price: 2.3,
        uri: "assets/images/pepper_addon.png",
      ),
      FoodAddOnModel(
        id: "03",
        name: "Pepper Julienned",
        price: 2.3,
        uri: "assets/images/pepper_addon.png",
      ),
      FoodAddOnModel(
        id: "011",
        name: "Pepper Julienned",
        price: 2.3,
        uri: "assets/images/pepper_addon.png",
      ),
      FoodAddOnModel(
        id: "022",
        name: "Pepper Julienned",
        price: 2.3,
        uri: "assets/images/pepper_addon.png",
      ),
      FoodAddOnModel(
        id: "033",
        name: "Pepper Julienned",
        price: 2.3,
        uri: "assets/images/pepper_addon.png",
      ),
    ],
  ).obs;

  final RxList<String> _addOnIds = <String>[].obs;

  final RxInt _quantity = 1.obs;

  List<String> get addOnIds => _addOnIds;
  int get quantity => _quantity.value;
  FoodDetailModel get food => _food.value;

  void doMakeFavourite() {
    _food.value.favourite = !_food.value.favourite;
    _food.refresh();
  }

  void doIncrease() {
    _quantity(_quantity.value + 1);
  }

  void doDecrease() {
    if (_quantity.value - 1 > 0) {
      _quantity(_quantity.value - 1);
    }
  }

  void doCheckAddOn(String id) {
    if (_addOnIds.contains(id)) {
      _addOnIds.removeWhere((element) => element == id);
    } else {
      _addOnIds.add(id);
    }
    _addOnIds.refresh();
  }
}
