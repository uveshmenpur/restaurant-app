import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/ui/routing/stack.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class CommonCloseButton extends StatelessWidget {
  const CommonCloseButton({
    super.key, this.buttonColor,
  });
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, WidgetRef ref, Widget? child) {
        return InkWell(
          onTap: () {
            ref.watch(navigationStackController).pop();
          },
          child: Text(
            AppString.keyClose,
            style: TextStyles.regular.copyWith(
              color: buttonColor ?? AppColors.white,
            ),
          ),
        );
      },
    );
  }
}