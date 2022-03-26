class RestaurantModel {
  final String id;
  final String name;
  final double rating;
  final int totalRating;
  bool favourite;
  final int deliveryFee;
  final String timer;
  final List<String> categoryIds;
  final String uri;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.totalRating,
    required this.favourite,
    required this.deliveryFee,
    required this.timer,
    required this.categoryIds,
    required this.uri,
  });
}
