import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

///Common Filter Restaurant Slider
class RangeFilterSlider extends StatelessWidget {
  const RangeFilterSlider({
    super.key,
    required this.title,
    required this.unit,
    required this.startValue,
    required this.endValue, required this.rangeSlider, this.icon,
  });

  final String title;
  final String unit;
  final num startValue;
  final num endValue;
  final Widget rangeSlider;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: title,
                style: TextStyles.regular.copyWith(
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
                children: [
                  TextSpan(
                    text: unit,
                    style: TextStyles.regular.copyWith(
                      color: AppColors.white.withOpacity(0.7),
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: icon,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text(
                startValue.toString(),
                style: TextStyles.medium.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
              Expanded(
                child: rangeSlider
              ),
              Text(
                endValue.toString(),
                style: TextStyles.medium.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
