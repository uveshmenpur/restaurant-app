import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation_controller.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class MakeReservationSelectTime extends StatelessWidget {
  const MakeReservationSelectTime({super.key, required this.index, required this.makeReservationWatch, required this.list});
  final int index;
  final MakeReservationController makeReservationWatch;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        makeReservationWatch.setTime(list[index]);
      },
      child: Container(
        decoration: BoxDecoration(
          color: list[index] == makeReservationWatch.selectedTime ? AppColors.restaurantOpenColor.withOpacity(0.4) : Colors.transparent,
          border: Border.all(
            color: AppColors.selectedPageIndicatorColor.withOpacity(0.2),
          ),
        ),
        child: Center(
          child: Text(
            list[index],
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
