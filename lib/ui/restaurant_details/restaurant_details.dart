import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/ui/restaurant_details/mobile/restaurant_details_mobile.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';


class RestaurantDetails extends StatelessWidget with BaseStatelessWidget {
  const RestaurantDetails({Key? key, required this.restaurant}) : super(key: key);
  final Restaurant restaurant;

  ///Build Override
  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return RestaurantDetailsMobile(restaurant: restaurant,);
        },
        desktop: (BuildContext context) {
          return RestaurantDetailsMobile(restaurant: restaurant,);
        }
    );
  }
}