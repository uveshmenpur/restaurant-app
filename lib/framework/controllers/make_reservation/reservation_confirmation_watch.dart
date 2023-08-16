import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant/framework/dependency_injection/inject.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/framework/repository/make_reservation/reservation.dart';

final reservationConfirmedController = ChangeNotifierProvider((ref) {
  return getIt<ReservationConfirmedController>();
});

@Injectable()
class ReservationConfirmedController extends ChangeNotifier {
  Reservation reservation = Reservation(
    peopleCount: 0,
    reservationTime: DateTime.now(),
    restaurant: Restaurant(
      price: '',
      imageUrl: '',
      restaurantName: '',
      rating: 1,
      distance: 1,
      comments: 1,
      category: '',
    ),
  );
  List<Reservation> previousReservation = [];
  List<Reservation> upcomingReservation = [];

  void addReservation(Reservation reservation) {
    if (reservation.reservationTime.month < DateTime.now().month &&
        reservation.reservationTime.day < DateTime.now().day) {
      previousReservation.add(reservation);
    } else {
      previousReservation.add(reservation);
    }
  }

  void setReservation(Reservation newReservation) {
    reservation = newReservation;
    notifyListeners();
  }

  void manageReservation() {
    reservation.isManageReservationEnabled =
        !reservation.isManageReservationEnabled;
    notifyListeners();
  }
  void isAwaitingConfirmation() {
    reservation.isAwaitingConfirmation =
    !reservation.isAwaitingConfirmation;
    notifyListeners();
  }


}
