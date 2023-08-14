import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant/framework/dependency_injection/inject.dart';

final restaurantDetailsController = ChangeNotifierProvider((ref) {
  return getIt<RestaurantDetailsController>();
});

@Injectable()
class RestaurantDetailsController extends ChangeNotifier{
  int selectedPage = 0;

  void jumpToPage(int newPage){
    selectedPage = newPage;
    notifyListeners();
  }
}