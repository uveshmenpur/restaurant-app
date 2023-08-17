import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation/make_reservation_form_controller.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class CommonTextField extends StatelessWidget with BaseStatelessWidget{
  const CommonTextField({
    super.key,
    required this.controller,
    required this.index,
    this.validator,
    required this.node,
    this.contentPadding,
    this.keyboard,
    this.prefix,
    this.prefixText,
    this.prefixIcon,
    this.maxLength, this.maxLines,
  });

  final MakeReservationFormController controller;
  final int index;
  final FocusNode node;
  final String? Function(String?)? validator;
  final EdgeInsets? contentPadding;
  final TextInputType? keyboard;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget buildPage(BuildContext context) {
    return TextFormField(
      focusNode: node,
      style: TextStyles.medium.copyWith(
        fontSize: 18.sp,
        color: AppColors.selectedPageIndicatorColor,
      ),
      validator: validator,
      decoration: InputDecoration(
       prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefix: prefix,
        counterText: '',
        errorStyle: TextStyles.medium.copyWith(

        ),
        hintText: AppString.inputHint[index],
        border: UnderlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.selectedPageIndicatorColor.withOpacity(0.5)),
        ),
        prefixStyle: TextStyles.medium.copyWith(
          fontSize: 18.sp,
          color: node.hasFocus
              ? AppColors.selectedPageIndicatorColor.withOpacity(0.4)
              : AppColors.selectedPageIndicatorColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.selectedPageIndicatorColor.withOpacity(0.5)),
        ),
        hintStyle: TextStyles.medium.copyWith(
          fontSize: 18.sp,
          color: node.hasFocus
              ? AppColors.selectedPageIndicatorColor.withOpacity(0.4)
              : AppColors.selectedPageIndicatorColor,
        ),
        contentPadding:
        contentPadding ?? EdgeInsets.fromLTRB(30.w, 30.h, 0.0, 10.h),
      ),
      onTapOutside: (pointer) {
        node.unfocus();
      },
      onSaved: (value) {
        controller.validate();
      },
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: TextInputAction.next,
      keyboardType: keyboard,
    );
  }
}
