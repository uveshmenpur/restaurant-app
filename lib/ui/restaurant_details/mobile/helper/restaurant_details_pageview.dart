import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/restaurant_details_controller.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class RestaurantDetailsPageView extends StatelessWidget {
  const RestaurantDetailsPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final restaurantDetailWatch = ref.watch(restaurantDetailsController);
        return SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              ...List.generate(
                AppString.restaurantDetailsTabs.length,
                    (index) {
                  return Flexible(
                    child: InkWell(
                      onTap: () {
                        restaurantDetailWatch.jumpToPage(index);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 21.h,
                            child: Center(
                              child: Text(
                                AppString.restaurantDetailsTabs[index],
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
                          Container(
                            height: 8.h,
                            color: AppColors.selectedPageIndicatorColor
                                .withOpacity(
                                restaurantDetailWatch.selectedPage == index
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
