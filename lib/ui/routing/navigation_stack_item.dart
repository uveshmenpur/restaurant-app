
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/framework/repository/make_reservation/model/reservation.dart';
part 'navigation_stack_item.freezed.dart';

@freezed
class NavigationStackItem with _$NavigationStackItem{
  const factory NavigationStackItem.home() = NavigationStackItemHome;
  const factory NavigationStackItem.restaurantDetails(Restaurant restaurant) = NavigationStackItemRestaurantDetails;
  const factory NavigationStackItem.makeReservation(Restaurant restaurant) = NavigationStackItemMakeReservation;
  const factory NavigationStackItem.reservationConfirmed(Reservation reservation) = NavigationStackItemReservationConfirmed;
  const factory NavigationStackItem.addLocation() = NavigationStackItemAddLocation;
}