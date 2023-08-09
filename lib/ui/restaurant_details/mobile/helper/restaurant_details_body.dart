import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/restaurant_details/mobile/helper/restaurant_perks.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class RestaurantDetailsBody extends StatelessWidget {
  const RestaurantDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: AppString.keyOpen,
              style: TextStyles.bold.copyWith(
                fontSize: 16.sp,
                color: AppColors.restaurantOpenColor,
              ),
              children: [
                TextSpan(
                  text: AppString.keyRestaurantTiming,
                  style: TextStyles.medium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.restaurantTimingColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
            width: double.infinity,
          ),
          Divider(
            height: 1.h,
            color: AppColors.black,
          ),
          SizedBox(
            height: 30.h,
            width: double.infinity,
          ),
          ...List.generate(
            AppString.perks.length,
                (index) => RestaurantPerks(
              restaurantPerk: AppString.perks[index],
            ),
          ),
          SizedBox(
            height: 30.h,
            width: double.infinity,
          ),
          Divider(
            height: 1.h,
            color: AppColors.black,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              AppString.keyRestaurantAddress,
              style: TextStyles.medium.copyWith(
                fontSize: 16.sp,
                height: 1.8.h,
                color: AppColors.black.withOpacity(0.7),
              ),
            ),
          ),
          RestaurantPerks(
            prefix: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.restaurantPhoneColor.withOpacity(0.3),
              ),
              width: 35.w,
              height: 35.h,
              child: Icon(
                Icons.phone_enabled,
                color: AppColors.black.withOpacity(0.8),
              ),
            ),
            restaurantPerk: '',
            text: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Text(
                AppString.keyRestaurantPhoneNumber,
                style: TextStyles.medium.copyWith(
                  color: AppColors.black.withOpacity(0.7),
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}