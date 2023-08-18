import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_assets.dart';

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

///List of Restaurants Displayed on Home Screen
List<Restaurant> restaurants = [
  Restaurant(
    restaurantName: 'Vivitalia',
    rating: 3.6,
    distance: 2.1,
    comments: 3,
    category: 'Italian • Pizza • Asian',
    imageUrl: AppAssets.beef,
    price: AppString.keyThreeDollars,
  ),
  Restaurant(
    restaurantName: 'Kuriya',
    rating: 3.6,
    distance: 2.1,
    comments: 3,
    category: 'Japanese Fine Dining',
    imageUrl: AppAssets.carrot,
    price: AppString.keyThreeDollars,
  ),
  Restaurant(
    restaurantName: 'Dolcetto by Basilico - Regent Hotel',
    rating: 3.6,
    distance: 2.1,
    comments: 3,
    category: 'Greek',
    imageUrl: AppAssets.food,
    price: AppString.keyThreeDollars,
  ),
  Restaurant(
    restaurantName: 'OSO',
    rating: 3.6,
    distance: 2.1,
    comments: 3,
    category: 'Italian Fine Dining',
    imageUrl: AppAssets.beef,
    price: AppString.keyThreeDollars,
  ),
];