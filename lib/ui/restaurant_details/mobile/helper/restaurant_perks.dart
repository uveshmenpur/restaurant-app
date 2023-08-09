import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class RestaurantPerks extends StatelessWidget {
  const RestaurantPerks({super.key, required this.restaurantPerk, this.prefix, this.lineHeight, this.text});

  final String restaurantPerk;
  final Widget? prefix;
  final Widget? text;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        prefix ?? Padding(
          padding: EdgeInsets.only(right:10.w,top: 14.h),
          child: Icon(
            Icons.done,
            color: AppColors.doneIconColor,
            size: 18.h,
          ),
        ),
        text ?? Text(
          restaurantPerk,
          style: TextStyles.medium.copyWith(
            color: AppColors.black.withOpacity(0.7),
            fontSize: 16.sp,
            height: lineHeight ?? 2.5,
          ),
        ),
      ],
    );
  }
}
