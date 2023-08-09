class Restaurant {
  Restaurant({
    required this.price,
    required this.imageUrl,
    required this.restaurantName,
    required this.rating,
    required this.distance,
    required this.comments,
    required this.category,
    this.isFavorite = false,
  });

  final String restaurantName;
  final String imageUrl;
  final double rating;
  final double distance;
  final int comments;
  final String category;
  final String price;
  bool isFavorite;
}
