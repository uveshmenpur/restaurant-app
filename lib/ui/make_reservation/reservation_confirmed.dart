import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:restaurant/framework/repository/make_reservation/reservation.dart';
import 'package:restaurant/ui/make_reservation/mobile/reservation_confirmation.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';

class ReservationConfirmed extends StatelessWidget with BaseStatelessWidget {
  const ReservationConfirmed({Key? key, required this.reservation})
      : super(key: key);
  final Reservation reservation;

  ///Build Override
  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(mobile: (BuildContext context) {
      return ReservationConfirmedMobile(reservation: reservation);
    }, desktop: (BuildContext context) {
      return ReservationConfirmedMobile(reservation: reservation,);
    });
  }
}
