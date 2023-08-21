import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation/reservation_confirmation_controller.dart';
import 'package:restaurant/framework/repository/make_reservation/model/reservation.dart';
import 'package:restaurant/ui/routing/navigation_stack_item.dart';
import 'package:restaurant/ui/routing/stack.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';
import 'package:restaurant/ui/utils/widgets/common_close_button.dart';
import 'package:restaurant/ui/utils/widgets/restaurant_reservation_card.dart';

class ReservationConfirmedMobile extends StatelessWidget
    with BaseStatelessWidget {
  const ReservationConfirmedMobile({super.key, required this.reservation});

  final Reservation reservation;

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.makeReservationBgColor,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 54.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CommonCloseButton(
                buttonColor: AppColors.primaryBrown,
              ),
              SizedBox(
                width: 30.w,
              ),
            ],
          ),
          SizedBox(
            height: 63.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 238.w,
                height: 68.h,
                child: Text(
                  AppString.keyYouWillReceive,
                  textAlign: TextAlign.center,
                  style: TextStyles.bold.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.primaryBrown,
                  ),
                  maxLines: 3,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final reservationWatch =
                  ref.watch(reservationConfirmedController);
              return RestaurantReservationCard(
                reservation: reservationWatch.upcomingReservation.last,
                onRatingUpdate: (double value) {
                  reservationWatch.updateUpcomingRating(
                      reservationWatch.upcomingReservation.length - 1, value);
                },
                onCloseTapped: () {
                  reservationWatch.manageUpcomingReservation(
                      reservationWatch.upcomingReservation.length - 1);
                },
                onCancelReservationTapped: () {
                  reservationWatch.deleteUpcomingReservation(
                      reservationWatch.upcomingReservation.length - 1);
                  ref
                      .watch(navigationStackController)
                      .popUntil(const NavigationStackItem.home());
                },
                onMakeChangesTapped: () {
                  ref
                      .watch(navigationStackController)
                      .popUntil(const NavigationStackItem.home());
                  ref.watch(navigationStackController).push(
                      NavigationStackItem.makeReservation(reservationWatch
                          .upcomingReservation.last.restaurant));
                },
                onManageReservationTapped: () {
                  reservationWatch.manageUpcomingReservation(
                      reservationWatch.upcomingReservation.length - 1);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
