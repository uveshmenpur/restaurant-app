import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/home/home_controller.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

///Covid Banner Displayed on app start
class HomeCovidBanner extends StatelessWidget {
  const HomeCovidBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Visibility(
          visible: ref.watch(homeController).isBannerVisible,
          child: Container(
            color: AppColors.bannerGrey,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  AppString.keyBannerTitle,
                  style: TextStyles.bold.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(
                  height: 83.h,
                  child: Text(
                    AppString.keyBannerContent,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    softWrap: true,
                    style: TextStyles.regular.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.black.withOpacity(0.7),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text(
                        AppString.keyOk,
                        style: TextStyles.bold.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.black,
                        ),
                      ),
                      onTap: () {
                        ref.watch(homeController).hideBanner();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
