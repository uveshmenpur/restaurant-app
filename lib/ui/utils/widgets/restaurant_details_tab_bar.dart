import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation_controller.dart';
import 'package:restaurant/framework/controllers/restaurant_details_controller.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';


class RestaurantDetailsTabBar extends StatelessWidget {
  const RestaurantDetailsTabBar({
    super.key,
    required this.list,
    this.isReservationTimePicker = false,
    required this.onPressed,
  });

  final List<String> list;
  final bool isReservationTimePicker;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final makeReservationWatch = ref.watch(makeReservationController);
        final restaurantDetailWatch = ref.watch(restaurantDetailsController);
        return SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              ...List.generate(
                list.length,
                (index) {
                  return Flexible(
                    child: InkWell(
                      onTap: () {
                        onPressed(index);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 21.h,
                            child: Center(
                              child: Text(
                                list[index],
                                style: TextStyles.semiBold.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          isReservationTimePicker
                              ? Container(
                                  height: 8.h,
                                  color: AppColors.selectedPageIndicatorColor
                                      .withOpacity(makeReservationWatch
                                                  .reservationTime ==
                                              index
                                          ? 1.0
                                          : 0.1),
                                )
                              : Container(
                                  height: 8.h,
                                  color: AppColors.selectedPageIndicatorColor
                                      .withOpacity(
                                          restaurantDetailWatch.selectedPage ==
                                                  index
                                              ? 1.0
                                              : 0.1),
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
