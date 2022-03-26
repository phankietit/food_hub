class FoodModel {
  final String id;
  final String name;
  final String description;
  final double rating;
  final int totalRating;
  bool favourite;
  final String uri;
  final double price;

  FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.totalRating,
    required this.favourite,
    required this.uri,
    required this.price,
  });
}

class FoodDetailModel {
  final String id;
  final String name;
  final String description;
  final double rating;
  final int totalRating;
  bool favourite;
  final String uri;
  final double price;
  final List<FoodAddOnModel> addOns;

  FoodDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.totalRating,
    required this.favourite,
    required this.uri,
    required this.price,
    required this.addOns,
  });
}

class FoodAddOnModel {
  final String id;
  final String name;
  final String uri;
  final double price;

  const FoodAddOnModel({
    required this.id,
    required this.name,
    required this.price,
    required this.uri,
  });
}
