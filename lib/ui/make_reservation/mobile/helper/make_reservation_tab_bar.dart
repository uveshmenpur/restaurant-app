import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation_controller.dart';
import 'package:restaurant/framework/utility/extension/date_time.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class MakeReservationTabBar extends StatelessWidget {
  const MakeReservationTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final makeReservationWatch = ref.watch(makeReservationController);
        return Row(
          children: [
            InkWell(
              onTap: () {
                makeReservationWatch.jumpToPage(1);
              },
              child: Container(
                width: 0.5.sw,
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        AppColors.selectedPageIndicatorColor.withOpacity(0.1),
                  ),
                  color: makeReservationWatch.selectedPage == 1
                      ? AppColors.selectedPageIndicatorColor.withOpacity(0.1)
                      : AppColors.makeReservationBgColor,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Icon(
                      Icons.person_outline,
                      size: 20.h,
                      color: AppColors.selectedPageIndicatorColor,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          makeReservationWatch.selectedPersonCount.toString(),
                          style: TextStyles.medium.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                makeReservationWatch.jumpToPage(2);
              },
              child: Container(
                width: 0.5.sw,
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        AppColors.selectedPageIndicatorColor.withOpacity(0.1),
                  ),
                  color: makeReservationWatch.selectedPage == 2
                      ? AppColors.selectedPageIndicatorColor.withOpacity(0.1)
                      : AppColors.makeReservationBgColor,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Icon(
                      Icons.date_range_outlined,
                      size: 20.h,
                      color: AppColors.selectedPageIndicatorColor,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '${makeReservationWatch.dateTime.weekdayName},${makeReservationWatch.dateTime.day} ${makeReservationWatch.dateTime.monthName}',
                          style: TextStyles.medium.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
