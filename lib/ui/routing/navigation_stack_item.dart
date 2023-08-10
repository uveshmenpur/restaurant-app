
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
part 'navigation_stack_item.freezed.dart';

@freezed
class NavigationStackItem with _$NavigationStackItem{
  const factory NavigationStackItem.home() = NavigationStackItemHome;
  const factory NavigationStackItem.restaurantDetails(Restaurant restaurant) = NavigationStackItemRestaurantDetails;
  const factory NavigationStackItem.makeReservation(Restaurant restaurant) = NavigationStackItemMakeReservation;
}