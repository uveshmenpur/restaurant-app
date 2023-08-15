import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/home/home_controller.dart';
import 'package:restaurant/ui/home/mobile/helper/home_filter_range_slider.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';

///Restaurant Filter Range-Sliders
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
          RangeFilterSlider(
            title: 'Price',
            unit: '(AED)',
            startValue: homeWatch.startPrice,
            endValue: homeWatch.endPrice,
            rangeSlider: RangeSlider(
              values: RangeValues(homeWatch.startPrice.toDouble(),
                  homeWatch.endPrice.toDouble()),
              activeColor: AppColors.sliderRangeColor,
              inactiveColor: AppColors.sliderRangeColor,
              divisions: 190,
              min: 20,
              max: 200,
              onChanged: (RangeValues value) {
                homeWatch.setPrice(value.start, value.end);
              },
            ),
          ),
          RangeFilterSlider(
            title: 'Rating',
            unit: '',
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: Icon(
                Icons.star,
                color: AppColors.white.withOpacity(0.7),
                size: 18.0,
              ),
            ),
            startValue: homeWatch.startRating,
            endValue: homeWatch.endRating,
            rangeSlider: RangeSlider(
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
          RangeFilterSlider(
            title: 'Distance',
            unit: '(km)',
            startValue: homeWatch.startDistance,
            endValue: homeWatch.endDistance,
            rangeSlider: RangeSlider(
              values: RangeValues(homeWatch.startDistance.toDouble(),
                  homeWatch.endDistance.toDouble()),
              activeColor: AppColors.sliderRangeColor,
              inactiveColor: AppColors.sliderRangeColor,
              min: 1.0,
              max: 10.0,
              onChanged: (RangeValues value) {
                homeWatch.setDistance(value.start, value.end);
              },
            ),
          ),
        ],
      ),
    );
  }
}
