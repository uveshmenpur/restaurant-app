import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/home_controller.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class HomeFilterRestaurant extends ConsumerWidget {
  const HomeFilterRestaurant({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeWatch = ref.watch(homeController);
    return Visibility(
      visible: homeWatch.isFilterVisible,
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          RichText(
            text: TextSpan(
              text: 'Price',
              style: TextStyles.regular.copyWith(
                color: AppColors.white,
                fontSize: 16.sp,
              ),
              children: [
                TextSpan(
                  text: '(AED)',
                  style: TextStyles.regular.copyWith(
                    color: AppColors.white.withOpacity(0.7),
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  homeWatch.startPrice.toString(),
                  style: TextStyles.medium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
                Expanded(
                  child: RangeSlider(
                    values: RangeValues(homeWatch.startPrice.toDouble(),
                        homeWatch.endPrice.toDouble()),
                    activeColor: AppColors.sliderRangeColor,
                    inactiveColor: AppColors.sliderRangeColor,
                    divisions: 190,
                    min: 10,
                    max: 200,
                    onChanged: (RangeValues value) {
                      homeWatch.setPrice(value.start, value.end);
                    },
                  ),
                ),
                Text(
                  homeWatch.endPrice.toString(),
                  style: TextStyles.medium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rating',
                style: TextStyles.regular.copyWith(
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: Icon(
                  Icons.star,
                  color: AppColors.white.withOpacity(0.7),
                  size: 18.0,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  homeWatch.startRating.toString(),
                  style: TextStyles.medium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
                Expanded(
                  child: RangeSlider(
                    values: RangeValues(homeWatch.startRating.toDouble(),
                        homeWatch.endRating.toDouble()),
                    activeColor: AppColors.sliderRangeColor,
                    inactiveColor: AppColors.sliderRangeColor,
                    min: 1.0,
                    max: 5.0,
                    onChanged: (RangeValues value) {
                      homeWatch.setRating(value.start, value.end);
                    },
                  ),
                ),
                Text(
                  homeWatch.endRating.toString(),
                  style: TextStyles.medium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Distance',
              style: TextStyles.regular.copyWith(
                color: AppColors.white,
                fontSize: 16.sp,
              ),
              children: [
                TextSpan(
                  text: '(km)',
                  style: TextStyles.regular.copyWith(
                    color: AppColors.white.withOpacity(0.7),
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  homeWatch.startDistance.toString(),
                  style: TextStyles.medium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
                Expanded(
                  child: RangeSlider(
                    values: RangeValues(homeWatch.startDistance.toDouble(),
                        homeWatch.endDistance.toDouble()),
                    activeColor: AppColors.sliderRangeColor,
                    inactiveColor: AppColors.sliderRangeColor,
                    divisions: 90,
                    min: 1.0,
                    max: 10.0,
                    onChanged: (RangeValues value) {
                      homeWatch.setDistance(value.start, value.end);
                    },
                  ),
                ),
                Text(
                  homeWatch.endDistance.toString(),
                  style: TextStyles.medium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}