import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation/make_reservation_controller.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class MakeReservationDateIndex extends StatelessWidget {
  const MakeReservationDateIndex({
    super.key,
    required this.index,
    required this.makeReservationWatch,
    this.size,
    this.margin,
    this.verticalPadding,
    this.horizontalPadding,
    this.onItemTapped,
    this.verticalMargin,
    this.horizontalMargin, this.fontColor, required this.month,
  });

  final int index;
  final MakeReservationController makeReservationWatch;
  final double? size;
  final double? margin;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? verticalMargin;
  final double? horizontalMargin;
  final Color? fontColor;
  final int month;
  final void Function()? onItemTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTapped ??
              () {
            makeReservationWatch.selectDate(index,month);
            makeReservationWatch.jumpToPage(3);
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
          color: makeReservationWatch.selectedDay == index && makeReservationWatch.selectedMonth == month
              ? AppColors.restaurantOpenColor.withOpacity(0.3)
              : AppColors.makeReservationBgColor,
          shape: makeReservationWatch.selectedDay == index && makeReservationWatch.selectedMonth == month
              ? BoxShape.circle
              : BoxShape.rectangle,
        ),
        child: Center(
          child: Text(
            index > 0 ? index.toString() : '',
            style: TextStyles.medium.copyWith(
              fontSize: 18.sp,
              color: fontColor ?? AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
