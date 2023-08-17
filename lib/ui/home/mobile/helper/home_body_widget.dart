import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/home/home_controller.dart';
import 'package:restaurant/framework/controllers/make_reservation/reservation_confirmation_controller.dart';
import 'package:restaurant/ui/home/mobile/helper/home_filter_restaurant.dart';
import 'package:restaurant/ui/home/mobile/helper/home_search_bar.dart';
import 'package:restaurant/ui/routing/navigation_stack_item.dart';
import 'package:restaurant/ui/routing/stack.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';
import 'package:restaurant/ui/utils/widgets/restaurant_card.dart';
import 'package:restaurant/ui/utils/widgets/restaurant_reservation_card.dart';

///Home-Screen Body Widget
class HomeBodyWidget extends StatelessWidget with BaseStatelessWidget {
  const HomeBodyWidget({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget buildPage(BuildContext context) {
    final homeWatch = ref.watch(homeController);
    final reservationConfirmedWatch = ref.watch(reservationConfirmedController);
    if (homeWatch.selectedPage == 0) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 22.h),
              child: Icon(
                Icons.location_on,
                color: AppColors.white.withOpacity(0.6),
                size: 16.0.w,
              ),
            ),
            //TODO implement onTap method
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.keyThomson,
                    style: TextStyles.regular.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.0.h),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 12.0.w,
                      color: AppColors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            const HomeSearchBar(),
            InkWell(
              onTap: () {
                homeWatch.changeFilter();
              },
              child: Text(
                AppString.keyFilter,
                style: TextStyles.regular.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            const HomeFilterRestaurant(),
            ...List.generate(
              homeWatch.restaurants.length,
              (index) {
                final restaurant = homeWatch.restaurants[index];
                return InkWell(
                  onTap: () {
                    ref.watch(navigationStackController).push(
                        NavigationStackItem.restaurantDetails(restaurant));
                  },
                  child: RestaurantCard(
                    image: restaurant.imageUrl,
                    rating: restaurant.rating.toString(),
                    restaurantName: restaurant.restaurantName,
                    distance: '${restaurant.distance} km',
                    commentCount: restaurant.comments.toString(),
                    restaurantCategory: restaurant.category,
                    price: restaurant.price,
                  ),
                );
              },
            ),
          ],
        ),
      );
    } else if (homeWatch.selectedPage == 1) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50.h,
            ),
            ListView.builder(
                itemCount: homeWatch.favorite.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final restaurant = homeWatch.favorite[index];
                  return InkWell(
                    onTap: () {
                      ref.watch(navigationStackController).push(
                          NavigationStackItem.restaurantDetails(restaurant));
                    },
                    child: RestaurantCard(
                      image: restaurant.imageUrl,
                      rating: restaurant.rating.toString(),
                      restaurantName: restaurant.restaurantName,
                      distance: '${restaurant.distance} km',
                      commentCount: restaurant.comments.toString(),
                      restaurantCategory: restaurant.category,
                      price: restaurant.price,
                    ),
                  );
                }),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 48.h,
            ),
            Text(
              AppString.keyYourReservation,
              style: TextStyles.bold.copyWith(
                color: AppColors.white.withOpacity(0.8),
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              AppString.keyUpcoming,
              style: TextStyles.medium.copyWith(
                fontSize: 18.sp,
                color: AppColors.white,
              ),
            ),
            reservationConfirmedWatch.upcomingReservation.isNotEmpty
                ? ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        reservationConfirmedWatch.upcomingReservation.length,
                    itemBuilder: (context, index) {
                      final reservation =
                          reservationConfirmedWatch.upcomingReservation[index];
                      return RestaurantReservationCard(
                          reservation: reservation);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 20.h,
                      );
                    },
                  )
                : Container(
                    height: 40.h,
                  ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Text(
                AppString.keyUpcoming,
                style: TextStyles.medium.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.white,
                ),
              ),
            ),
            ListView.separated(
              itemCount: reservationConfirmedWatch.previousReservation.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final reservation =
                    reservationConfirmedWatch.previousReservation[index];
                reservationConfirmedWatch.setReservation(reservation);
                return RestaurantReservationCard(reservation: reservation);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 20.h,
                );
              },
            ),
          ],
        ),
      );
    }
  }
}
