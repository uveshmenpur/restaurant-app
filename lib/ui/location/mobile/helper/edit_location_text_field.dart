import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class EditLocationTextField extends StatelessWidget {
  const EditLocationTextField({
    super.key,
    this.initialValue,
    required this.focusNode,
    this.keyboardType,
    this.label,
    this.maxLines,
    this.onTapOutSide,
    required this.validator,
    this.hintText,
  });

  final String? initialValue;
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? label;
  final String? hintText;
  final void Function(PointerDownEvent)? onTapOutSide;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      focusNode: focusNode,
      keyboardType: keyboardType,
      style: TextStyles.medium.copyWith(
        color: AppColors.white,
        fontSize: 28.sp,
      ),
      maxLines: maxLines,
      validator: validator,
      onTapOutside: onTapOutSide,
      cursorHeight: 28.sp,
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        errorStyle: TextStyles.medium.copyWith(
            fontSize: 12.sp,
            color: AppColors.white.withOpacity(0.4),
            shadows: [
              Shadow(color: AppColors.red, blurRadius: 2.r),
            ]),
        isDense: true,
        hintText: hintText,
        hintMaxLines: 2,
        hintStyle: TextStyles.medium.copyWith(
          color: AppColors.white.withOpacity(0.8),
          fontSize: 26.sp,
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        border: InputBorder.none,
        label: Text(
          label ?? '',
          style: TextStyles.medium.copyWith(
            color: AppColors.white.withOpacity(0.6),
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
