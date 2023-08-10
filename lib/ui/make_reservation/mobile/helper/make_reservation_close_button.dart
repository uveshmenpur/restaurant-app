import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/routing/stack.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class MakeReservationCloseButton extends StatelessWidget {
  const MakeReservationCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(),
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return InkWell(
              onTap: () {
                ref.watch(navigationStackController).pop();
              },
              child: Text(
                AppString.keyClose,
                style: TextStyles.regular.copyWith(
                  color: AppColors.selectedPageIndicatorColor,
                ),
              ),
            );
          },
        ),
        SizedBox(
          width: 30.w,
        ),
      ],
    );
  }
}
