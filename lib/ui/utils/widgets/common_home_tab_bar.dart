import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/home/home_controller.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class CommonHomeTabBar extends ConsumerWidget
    with BaseConsumerWidget
    implements PreferredSizeWidget {
  const CommonHomeTabBar({
    super.key,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(33.h);
  }

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    final homeWatch = ref.watch(homeController);
    return SizedBox(
      width: double.infinity,
      height: 33.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                homeWatch.jumpToPage(index);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    padding: EdgeInsets.only(bottom: 7.h),
                    child: Text(
                      index == 0
                          ? AppString.keyNearBy
                          : index == 1
                              ? AppString.keyFavourites
                              : AppString.keyReservations,
                      style: TextStyles.regular.copyWith(
                        color: homeWatch.selectedPage == index
                            ? AppColors.white
                            : AppColors.white.withOpacity(0.6),
                        fontSize: 16.sp,
                        fontWeight: TextStyles.fwSemiBold,
                      ),
                    ),
                  ),
                  homeWatch.selectedPage == index
                      ? Container(
                          width: 20.w,
                          height: 5.h,
                          padding: EdgeInsets.zero,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 30.w,
            );
          },
          itemCount: 3),
    );
  }
}
