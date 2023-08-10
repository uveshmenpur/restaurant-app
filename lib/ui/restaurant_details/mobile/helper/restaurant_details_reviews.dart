import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/restaurant_details/mobile/helper/person_profile.dart';
import 'package:restaurant/ui/restaurant_details/mobile/helper/restaurant_review.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class RestaurantDetailsReview extends StatelessWidget {
  const RestaurantDetailsReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            AppString.keyRecommendedBy,
            style: TextStyles.bold.copyWith(
              fontSize: 18.sp,
              color: AppColors.reviewTextColor,
            ),
          ),
          Divider(
            thickness: 2.h,
            color: AppColors.black.withOpacity(0.5),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80.w,
                height: 36.h,
                child: Stack(
                  children: [
                    const PersonProfile(),
                    Positioned(
                      left: 20.w,
                      child: const PersonProfile(),
                    ),
                    Positioned(
                      left: 40.w,
                      child: const PersonProfile(),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: RichText(
                  text: TextSpan(
                    text: AppString.keyFauziMohammad,
                    style: TextStyles.semiBold.copyWith(
                        fontSize: 12.sp, color: AppColors.blueLinkColor),
                    children: [
                      TextSpan(
                        text: AppString.keyAnd,
                        style: TextStyles.semiBold.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.reviewTextColor,
                        ),
                      ),
                      TextSpan(
                        text: AppString.key142Other,
                        style: TextStyles.semiBold.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.blueLinkColor,
                        ),
                      ),
                      TextSpan(
                        text: AppString.keyHaveRecommended,
                        style: TextStyles.semiBold.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.reviewTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          const RestaurantReview(
            hasTitle: true,
            name: AppString.keyAzreena,
          ),
          const RestaurantReview(
            name: AppString.keyNana,
          ),
        ],
      ),
    );
  }
}
