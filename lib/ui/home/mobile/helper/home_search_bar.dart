import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/home/home_controller.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyBoxShadow,
            blurRadius: 15.r,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final homeWatch = ref.watch(homeController);

          /// TextFormField for search input
          return TextFormField(
            focusNode: homeWatch.searchBarNode,
            cursorColor: AppColors.searchBarText.withOpacity(0.7),
            cursorHeight: 16.h,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(18.0.w),
              hintText: AppString.keySearchRestaurants,
              hintStyle: TextStyles.regular.copyWith(
                fontSize: 18.sp,
                color: AppColors.searchBarText.withOpacity(0.7),
                decoration: TextDecoration.none,
              ),
              border: InputBorder.none,
            ),
            onTapOutside: (pointer) {
              homeWatch.unFocus();
            },
            style: TextStyles.regular.copyWith(
              fontSize: 18.sp,
              color: AppColors.searchBarText.withOpacity(0.7),
              decoration: TextDecoration.none,
            ),
          );
        },
      ),
    );
  }
}
