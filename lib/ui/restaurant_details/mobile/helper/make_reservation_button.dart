import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class MakeReservationButton extends StatelessWidget {
  const MakeReservationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120.h,
      child: Center(
        child: InkWell(
          onTap: () {
            debugPrint('Reservation is Done');
          },
          child: Container(
            width: 214.w,
            height: 40.h,
            color: AppColors.reservationButton,
            child: Center(
                child: Text(
              AppString.keyMakeAReservation,
              style: TextStyles.bold.copyWith(
                color: AppColors.white,
                fontSize: 16.sp,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
