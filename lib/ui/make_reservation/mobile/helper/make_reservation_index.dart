import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation_controller.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class MakeReservationIndex extends StatelessWidget {
  const MakeReservationIndex({
    super.key,
    required this.index,
    required this.makeReservationWatch,
    this.size,
    this.margin,
    this.verticalPadding,
    this.horizontalPadding,
    this.onItemTapped,
    this.verticalMargin,
    this.horizontalMargin,
  });

  final int index;
  final MakeReservationController makeReservationWatch;
  final double? size;
  final double? margin;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? verticalMargin;
  final double? horizontalMargin;
  final void Function()? onItemTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTapped ??
          () {
            makeReservationWatch.selectPerson(index);
          },
      child: Container(
        width: size?.w ?? 50.w,
        height: size?.h ?? 50.h,
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin?.w ?? 10.w,
          vertical: verticalMargin?.h ?? 10.h,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 10.w,
            vertical: verticalPadding?.h ?? 10.h),
        decoration: BoxDecoration(
          color: makeReservationWatch.selectedPersonCount == index
              ? AppColors.restaurantOpenColor.withOpacity(0.3)
              : AppColors.makeReservationBgColor,
          shape: makeReservationWatch.selectedPersonCount == index
              ? BoxShape.circle
              : BoxShape.rectangle,
        ),
        child: Center(
          child: Text(
            index > 0 ? index.toString() : '',
            style: TextStyles.medium.copyWith(
              fontSize: 18.sp,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
