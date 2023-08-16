import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation/reservation_confirmation_watch.dart';
import 'package:restaurant/framework/repository/make_reservation/reservation.dart';
import 'package:restaurant/framework/utility/extension/date_time.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class RestaurantReservationCard extends StatelessWidget with BaseStatelessWidget{
  const RestaurantReservationCard({
    super.key,
    required this.reservation,
  });

  final Reservation reservation;

  @override
  Widget buildPage(BuildContext context) {
    reservation.generateReservationId();
    return Container(
      width: 374.w,
      height: reservation.isAwaitingConfirmation ? 490.h : 460.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final reservationConfirmedWatch =
                ref.watch(reservationConfirmedController);
            return Container(
              color: AppColors.white,
              child: Column(
                children: [
                  Image.asset(
                    reservation.restaurant.imageUrl,
                    width: 374.w,
                    height: 220.h,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      reservation.restaurant.restaurantName,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      style: TextStyles.bold.copyWith(
                        color: AppColors.primaryBrown,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                  Text(
                    '${reservation.reservationTime.weekdayName}, ${reservation.reservationTime.day} ${reservation.reservationTime.monthName} \n ${reservation.reservationTime.hour}:${reservation.reservationTime.minute}',
                    style: TextStyles.medium.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.primaryBrown,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 18.h,
                        color: AppColors.selectedPageIndicatorColor,
                      ),
                      Text(
                        ' ${reservationConfirmedWatch.reservation.peopleCount}',
                        style: TextStyles.medium.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.primaryBrown,
                        ),
                      ),
                    ],
                  ),
                  if (reservationConfirmedWatch.reservation.isPrevious) ...{
                    ...[
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 176.w,
                        height: 40.h,
                        child: Text(
                          AppString.keyRateYourExperience,
                          style: TextStyles.medium.copyWith(
                            color: AppColors.primaryBrown,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                      RatingBarIndicator(itemBuilder: (BuildContext context, int index) { return Container(); },),
                    ]
                  } else ...{
                    if (reservationConfirmedWatch
                        .reservation.isAwaitingConfirmation) ...{
                      ...[
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          AppString.keyAwaitingConfirmation,
                          style: TextStyles.medium.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ]
                    } else ...{
                      SizedBox(
                        height: 30.h,
                      ),
                    },
                    ...[
                      InkWell(
                        child: Container(
                          height: 30.h,
                          width: 182.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.selectedPageIndicatorColor,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              AppString.keyManageReservation,
                              style: TextStyles.bold.copyWith(
                                color: AppColors.selectedPageIndicatorColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      RichText(
                        text: TextSpan(
                          text: AppString.keyReservationId,
                          style: TextStyles.medium.copyWith(
                            color: AppColors.selectedPageIndicatorColor,
                          ),
                          children: [
                            TextSpan(
                              text: reservation.reservationId,
                              style: TextStyles.bold.copyWith(
                                color: AppColors.selectedPageIndicatorColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  }
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
