import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/ui/make_reservation/mobile/make_reservation_mobile.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';


class MakeReservation extends StatelessWidget with BaseStatelessWidget {
  const MakeReservation({Key? key, required this.restaurant}) : super(key: key);
  final Restaurant restaurant;

  ///Build Override
  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return MakeReservationMobile(restaurant: restaurant,);
        },
        desktop: (BuildContext context) {
          return MakeReservationMobile(restaurant: restaurant,);
        }
    );
  }
}