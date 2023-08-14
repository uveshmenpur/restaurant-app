import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/ui/routing/navigation_stack_item.dart';
import 'package:restaurant/ui/routing/stack.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

///Make A Reservation Button
class MakeReservationButton extends StatelessWidget {
  const MakeReservationButton({
    super.key,
    this.restaurant,
    this.onTap,
  });

  final Restaurant? restaurant;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return SizedBox(
          width: double.infinity,
          height: 120.h,
          child: Center(
            child: InkWell(
              onTap: onTap ??
                  () {
                    ref.watch(navigationStackController).push(
                          NavigationStackItem.makeReservation(
                            restaurant ??
                                Restaurant(
                                  distance: 1.0,
                                  price: '',
                                  restaurantName: '',
                                  imageUrl: '',
                                  rating: 1.2,
                                  comments: 5,
                                  category: '',
                                ),
                          ),
                        );
                  },
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
