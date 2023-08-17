import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/utility/extension/int.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class MakeReservationWeekDay extends StatelessWidget with BaseStatelessWidget{
  const MakeReservationWeekDay({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      width: 53.w,
      height: 50.h,
      decoration: const BoxDecoration(
        color: AppColors.makeReservationBgColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      child: Center(
        child: Text(
          index.weekDay,
          style: TextStyles.medium.copyWith(
            fontSize: 18.sp,
            color: AppColors.black.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
