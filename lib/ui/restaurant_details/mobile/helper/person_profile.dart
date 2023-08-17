
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';

class PersonProfile extends StatelessWidget with BaseStatelessWidget{
  const PersonProfile({
    super.key, this.size, this.iconSize,
  });
  final double? size;
  final double? iconSize;

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      width: size?.w ?? 32.w,
      height: size?.h ?? 32.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.brownProfileColor,
        border: Border.all(
          color: AppColors.white,
          width: 3.w,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      child: Icon(
        Icons.person_rounded,
        size: iconSize?.w ?? 18.w,
        color: AppColors.white,
      ),
    );
  }
}
