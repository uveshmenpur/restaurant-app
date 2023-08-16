import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant/framework/dependency_injection/inject.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_assets.dart';

final homeController = ChangeNotifierProvider((ref) {
  return getIt<HomeController>();
});

@Injectable()
class HomeController extends ChangeNotifier {
  int selectedPage = 0;
  bool isBannerVisible = true;
  bool isFilterVisible = false;
  int startPrice = 20;
  int endPrice = 200;
  double startRating = 1.0;
  double endRating = 5.0;
  double startDistance = 1.0;
  double endDistance = 10.0;
  final searchBarNode = FocusNode();
  List<Restaurant> favorite = [];

  void unFocus(){
    searchBarNode.unfocus();
    notifyListeners();
  }

  void setPrice(double newStartPrice,double newEndPrice) {
    startPrice = newStartPrice.toInt();
    endPrice = newEndPrice.toInt();
    notifyListeners();
  }

  void addFavourite(Restaurant restaurant){
    favorite.add(restaurant);
    notifyListeners();
  }
  void removeFavourite(Restaurant restaurant){
    favorite.remove(restaurant);
    notifyListeners();
  }
  void setRating(double newStartRating,double newEndRating) {
    startRating = double.parse(newStartRating.toStringAsFixed(1));
    endRating = double.parse(newEndRating.toStringAsFixed(1));
    notifyListeners();
  }

  void setDistance(double newStartDistance,double newEndDistance) {
    startDistance = double.parse(newStartDistance.toStringAsFixed(1));
    endDistance = double.parse(newEndDistance.toStringAsFixed(1));
    notifyListeners();
  }
  void changeFilter(){
    isFilterVisible = !isFilterVisible;
    notifyListeners();
  }

  void hideBanner() {
    isBannerVisible = false;
    notifyListeners();
  }

  void jumpToPage(int page) {
    selectedPage = page;
    notifyListeners();
  }

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
}
