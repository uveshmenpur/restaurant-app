import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class MakeReservationTitle extends StatelessWidget {
  const MakeReservationTitle({
    super.key, required this.title, this.height, this.fontSize, this.fontColor,
  });
  final String title;
  final double? height;
  final double? fontSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: height ?? 74.h,
            child: Center(
              child: Text(
                title,
                style: TextStyles.bold.copyWith(
                  fontSize: fontSize ?? 18.sp,
                  color: fontColor ?? AppColors.selectedPageIndicatorColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
