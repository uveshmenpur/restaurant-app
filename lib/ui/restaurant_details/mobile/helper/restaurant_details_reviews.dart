import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            height: 2.h,
            color: AppColors.black.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
