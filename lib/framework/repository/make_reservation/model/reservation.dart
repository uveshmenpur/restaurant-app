import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/framework/utility/extension/int.dart';

class Reservation {
  Reservation({
    required this.peopleCount,
    required this.reservationTime,
    required this.restaurant,
    this.reservationId,
    this.isAwaitingConfirmation = false,
    this.isPrevious = false,
    this.isManageReservationEnabled = false,
    this.isRated = false,
    this.rating = 0
  });

  final Restaurant restaurant;
  final DateTime reservationTime;
  final int peopleCount;
  String? reservationId;
  bool isPrevious;
  bool isAwaitingConfirmation;
  bool isManageReservationEnabled;
  bool isRated;
  int? rating;

  void generateReservationId() {
    reservationId ??= 8.generateUniqueId;
  }
}
