import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/ui/routing/navigation_stack_item.dart';
import 'package:restaurant/ui/routing/stack.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class MakeReservationButton extends StatelessWidget {
  const MakeReservationButton({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return InkWell(
          onTap: () {
            ref
                .watch(navigationStackController)
                .push(NavigationStackItem.makeReservation(restaurant));
          },
          child: SizedBox(
            width: double.infinity,
            height: 120.h,
            child: Center(
              child: Container(
                width: 214.w,
                height: 40.h,
                color: AppColors.reservationButton,
                child: Center(
                  child: Text(
                    AppString.keyMakeAReservation,
                    style: TextStyles.bold.copyWith(
                      color: AppColors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
