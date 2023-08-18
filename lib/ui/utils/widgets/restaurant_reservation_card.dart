import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation/reservation_confirmation_controller.dart';
import 'package:restaurant/framework/repository/make_reservation/model/reservation.dart';
import 'package:restaurant/framework/utility/extension/date_time.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';
import 'package:restaurant/ui/utils/widgets/common_close_button.dart';

class RestaurantReservationCard extends StatelessWidget
    with BaseStatelessWidget {
  const RestaurantReservationCard({
    super.key,
    required this.reservation,
    this.onManageReservationTapped,
    this.onCancelReservationTapped,
    this.onMakeChangesTapped,
    this.onCloseTapped,
    required this.onRatingUpdate,
  });

  final Reservation reservation;
  final void Function()? onManageReservationTapped;
  final void Function()? onCancelReservationTapped;
  final void Function()? onMakeChangesTapped;
  final void Function()? onCloseTapped;
  final void Function(double value) onRatingUpdate;

  @override
  Widget buildPage(BuildContext context) {
    reservation.generateReservationId();
    return Container(
      width: 374.w,
      height: 460.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final reservationConfirmedWatch =
                ref.watch(reservationConfirmedController);
            return reservation.isManageReservationEnabled
                ? Container(
                    color: AppColors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: double.infinity,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            AppString.keyManageReservation,
                            textAlign: TextAlign.center,
                            style: TextStyles.bold.copyWith(
                              fontSize: 18.sp,
                              color: AppColors.selectedPageIndicatorColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 0.0, 20.w, 30.h),
                          child: const Divider(
                            color: AppColors.selectedPageIndicatorColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            reservationConfirmedWatch
                                .reservation.restaurant.restaurantName,
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
                              ' ${reservation.peopleCount}',
                              style: TextStyles.medium.copyWith(
                                fontSize: 18.sp,
                                color: AppColors.primaryBrown,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Are you sure you want to cancel your reservation?',
                                      style: TextStyles.bold.copyWith(
                                        fontSize: 24.sp,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    titlePadding: EdgeInsets.fromLTRB(20.w,40.h,20.w,0.0),
                                    actionsPadding: EdgeInsets.fromLTRB(
                                        0.0, 80.h, 20.w, 0.0),
                                    actions: [
                                      SizedBox(
                                        width: 260.w,
                                        height: 70.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 130.w,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                border: Border(
                                                  top: BorderSide(
                                                    color: AppColors.black
                                                        .withOpacity(0.3),
                                                  ),
                                                  right: BorderSide(
                                                    color: AppColors.black
                                                        .withOpacity(0.3),
                                                  ),
                                                ),
                                              ),
                                              child: Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'No',
                                                    style: TextStyles.bold
                                                        .copyWith(
                                                      fontSize: 18.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 130.w,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                border: Border(
                                                  top: BorderSide(
                                                    color: AppColors.black
                                                        .withOpacity(0.3),
                                                  ),
                                                ),
                                              ),
                                              child: Center(
                                                child: InkWell(
                                                  onTap:
                                                      onCancelReservationTapped,
                                                  child: Text(
                                                    'Yes,Cancel',
                                                    style: TextStyles.bold
                                                        .copyWith(
                                                      fontSize: 18.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            width: 182.w,
                            height: 30.h,
                            color: AppColors.selectedPageIndicatorColor
                                .withOpacity(0.2),
                            child: Center(
                              child: Text(
                                AppString.keyCancelReservation,
                                textAlign: TextAlign.center,
                                style: TextStyles.bold.copyWith(
                                  color: AppColors.selectedPageIndicatorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        InkWell(
                          onTap: onMakeChangesTapped,
                          child: Container(
                            width: 182.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: AppColors.selectedPageIndicatorColor,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                AppString.keyMakeChanges,
                                textAlign: TextAlign.center,
                                style: TextStyles.bold.copyWith(
                                  color: AppColors.selectedPageIndicatorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        CommonCloseButton(
                          onTap: onCloseTapped,
                          buttonColor: AppColors.selectedPageIndicatorColor,
                        ),
                        SizedBox(
                          height: 30.h,
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
                      ],
                    ),
                  )
                : Container(
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
                              ' ${reservation.peopleCount}',
                              style: TextStyles.medium.copyWith(
                                fontSize: 18.sp,
                                color: AppColors.primaryBrown,
                              ),
                            ),
                          ],
                        ),
                        if (reservation.isPrevious) ...{
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
                            SizedBox(
                              height: 10.h,
                            ),
                            RatingBar.builder(
                                initialRating: reservation.rating!.toDouble(),
                                itemBuilder: (BuildContext context, int index) {
                                  return index >=
                                          reservationConfirmedWatch
                                              .reservation.rating!
                                      ? const Icon(Icons.star_outline)
                                      : const Icon(Icons.star);
                                },
                                itemSize: 24.w,
                                glow: false,
                                onRatingUpdate: (value) {
                                  onRatingUpdate(value);
                                },
                                unratedColor: Colors.black),
                          ]
                        } else ...{
                          if (reservation.isAwaitingConfirmation) ...{
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
                              onTap: onManageReservationTapped,
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
                                      color:
                                          AppColors.selectedPageIndicatorColor,
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
                                      color:
                                          AppColors.selectedPageIndicatorColor,
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
