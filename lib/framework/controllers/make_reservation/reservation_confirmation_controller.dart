import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant/framework/dependency_injection/inject.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/framework/repository/make_reservation/model/reservation.dart';

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

  void updateRating(int rating) {
    reservation.rating = rating;
    notifyListeners();
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
    reservation.isAwaitingConfirmation = !reservation.isAwaitingConfirmation;
    notifyListeners();
  }

  List<Reservation> reservations = [
    Reservation(
      restaurant: restaurants[0],
      reservationTime: DateTime(2023, 8, 10, 18, 30),
      peopleCount: 4,
    ),
    Reservation(
      restaurant: restaurants[1],
      reservationTime: DateTime(2023, 8, 11, 20, 0),
      peopleCount: 2,
    ),
    Reservation(
      restaurant: restaurants[1],
      reservationTime: DateTime(2023, 8, 12, 19, 0),
      peopleCount: 6,
    ),
    Reservation(
      restaurant: restaurants[2],
      reservationTime: DateTime(2023, 8, 13, 12, 0),
      peopleCount: 3,
    ),
    Reservation(
      restaurant: restaurants[3],
      reservationTime: DateTime(2023, 8, 14, 17, 30),
      peopleCount: 5,
    ),
    Reservation(
      restaurant: restaurants[0],
      reservationTime: DateTime(2023, 8, 15, 18, 0),
      peopleCount: 4,
    ),
    Reservation(
      restaurant: restaurants[1],
      reservationTime: DateTime(2023, 8, 16, 21, 0),
      peopleCount: 2,
    ),
    Reservation(
      restaurant: restaurants[2],
      reservationTime: DateTime(2023, 8, 17, 13, 30),
      peopleCount: 7,
    ),
    Reservation(
      restaurant: restaurants[3],
      reservationTime: DateTime(2023, 8, 18, 16, 0),
      peopleCount: 3,
    ),
    Reservation(
      restaurant: restaurants[0],
      reservationTime: DateTime(2023, 8, 19, 19, 30),
      peopleCount: 5,
    ),
    Reservation(
      restaurant: restaurants[1],
      reservationTime: DateTime(2023, 8, 20, 12, 0),
      peopleCount: 6,
    ),
    Reservation(
      restaurant: restaurants[2],
      reservationTime: DateTime(2023, 8, 21, 17, 0),
      peopleCount: 4,
    ),
    Reservation(
      restaurant: restaurants[3],
      reservationTime: DateTime(2023, 8, 22, 20, 30),
      peopleCount: 2,
    ),
  ];

  void filterLists() {
    ///filter out previous reservations
    previousReservation = reservations
        .where((reservation) =>
            reservation.reservationTime.isBefore(DateTime.now()))
        .toList();

    ///filter out upcoming reservations
    upcomingReservation = reservations
        .where((reservation) =>
            reservation.reservationTime.isAfter(DateTime.now()))
        .toList();
  }
}
