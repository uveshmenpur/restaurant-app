import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation_controller.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/ui/make_reservation/mobile/helper/make_reservation_select_time.dart';
import 'package:restaurant/ui/restaurant_details/mobile/helper/make_reservation_button.dart';
import 'package:restaurant/ui/restaurant_details/mobile/helper/restaurant_details_pageview.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class MakeReservationTimePicker extends StatelessWidget {
  const MakeReservationTimePicker({super.key, this.restaurant});

  final Restaurant? restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40.h,
          width: double.infinity,
        ),
        Icon(
          Icons.watch_later_outlined,
          size: 14.h,
          color: AppColors.selectedPageIndicatorColor,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          AppString.keyAvailabeTimes,
          style: TextStyles.bold.copyWith(
            fontSize: 16.sp,
            color: AppColors.selectedPageIndicatorColor,
          ),
        ),
        SizedBox(
          height: 35.h,
        ),
        const RestaurantDetailsPageView(
          list: AppString.reservationTime,
          isReservationTimePicker: true,
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final makeReservationWatch = ref.watch(makeReservationController);
            return SizedBox(
              height: 180.h,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 93 / 50,
                ),
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (context, index) {
                  final List<String> list =
                      makeReservationWatch.reservationTime == 0
                          ? AppString.breakFastTime
                          : makeReservationWatch.reservationTime == 1
                              ? AppString.lunchTime
                              : AppString.dinnerTime;
                  return MakeReservationSelectTime(
                    index: index,
                    makeReservationWatch: makeReservationWatch,
                    list: list,
                  );
                },
              ),
            );
          },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Text(
                AppString.keyRestaurantTermsAndCondition,
                textAlign: TextAlign.start,
                style: TextStyles.bold.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.selectedPageIndicatorColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: double.infinity,
              child: Text(
                AppString.keyTermsAndConditions,
                style: TextStyles.medium.copyWith(
                  color: AppColors.black,
                ),
              ),
            )
          ],
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return MakeReservationButton(
              onTap: () {
                ref.watch(makeReservationController).jumpToPage(4);
              },
            );
          },
        ),
      ],
    );
  }
}
