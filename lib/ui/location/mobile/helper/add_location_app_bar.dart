import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/routing/stack.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class AddLocationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddLocationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return InkWell(
                    onTap: () {
                      ref.watch(navigationStackController).pop();
                    },
                    child: Icon(
                      Icons.arrow_left,
                      size: 54.h,
                      fill: 1.0,
                      color: AppColors.white,
                    ),
                  );
                },
              ),
              Expanded(
                  child: Container(
                height: 56.h,
              )),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return Padding(
                    padding: EdgeInsets.only(top: 8.h, right: 16.w),
                    child: InkWell(
                      onTap: () {
                        ref.watch(navigationStackController).pop();
                      },
                      child: Text(
                        'DONE',
                        style: TextStyles.medium.copyWith(
                          color: AppColors.white.withOpacity(0.6),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(96.h);
}
