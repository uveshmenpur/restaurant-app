import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class EditLocationTextField extends StatelessWidget {
  const EditLocationTextField(
      {super.key, this.initialValue, required this.focusNode, this.keyboardType, this.label,});

  final String? initialValue;
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      focusNode: focusNode,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          label: Text(
            label ?? '',
            style: TextStyles.medium.copyWith(
              color: AppColors.white.withOpacity(0.6),
              fontSize: 18.sp,
            ),
          ),
          labelText: label
      ),
    );
  }
}
