import 'package:food_hub/controllers/base_controller.dart';
import 'package:food_hub/models/food_model.dart';
import 'package:food_hub/models/restaurant_model.dart';
import 'package:get/get.dart';

class RestaurantController extends BaseController {
  final RxList<RestaurantModel> _restaurants = [
    RestaurantModel(
      id: "01",
      categoryIds: ["01", "02"],
      deliveryFee: 0,
      favourite: true,
      name: "McDonald’s",
      rating: 4.5,
      timer: "10-15 mins",
      totalRating: 30,
      uri: "assets/images/restaurants/mc_donald.png",
    ),
    RestaurantModel(
      id: "02",
      categoryIds: ["03", "05", "01"],
      deliveryFee: 0,
      favourite: false,
      name: "Starbucks",
      rating: 4.5,
      timer: "10-15 mins",
      totalRating: 30,
      uri: "assets/images/restaurants/starbucks.png",
    ),
  ].obs;

  final RxList<FoodModel> _popularFoods = [
    FoodModel(
      id: "01",
      favourite: true,
      name: "Salmon Salad",
      rating: 4.5,
      totalRating: 30,
      uri: "assets/images/restaurants/noodles.png",
      description: "Baked salmon fish",
      price: 5.50,
    ),
    FoodModel(
      id: "02",
      favourite: true,
      name: "Salmon Salad",
      rating: 4.5,
      totalRating: 30,
      uri: "assets/images/restaurants/pizza.png",
      description: "Baked salmon fish",
      price: 5.50,
    ),
    FoodModel(
      id: "03",
      favourite: true,
      name: "Salmon Salad",
      rating: 4.5,
      totalRating: 30,
      uri: "assets/images/restaurants/noodles.png",
      description: "Baked salmon fish",
      price: 5.50,
    ),
    FoodModel(
      id: "04",
      favourite: true,
      name: "Salmon Salad",
      rating: 4.5,
      totalRating: 30,
      uri: "assets/images/restaurants/mc_donald.png",
      description: "Baked salmon fish",
      price: 5.50,
    ),
  ].obs;

  List<RestaurantModel> get restaurants => _restaurants;
  List<FoodModel> get popularFoods => _popularFoods;

  void doMakeFavouriteRestaurant(String id) {
    final item = _restaurants.firstWhere((element) => element.id == id);
    item.favourite = !item.favourite;
    _restaurants.refresh();
  }

  void doMakeFavouriteFood(String id) {
    final item = _popularFoods.firstWhere((element) => element.id == id);
    item.favourite = !item.favourite;
    _restaurants.refresh();
  }
}
