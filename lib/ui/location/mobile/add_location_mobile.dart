import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/location/add_location_controller.dart';
import 'package:restaurant/ui/home/mobile/helper/home_search_bar.dart';
import 'package:restaurant/ui/location/mobile/helper/add_location_app_bar.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class AddLocationMobile extends ConsumerWidget with BaseConsumerWidget {
  const AddLocationMobile({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    final locationWatch = ref.watch(addLocationController);
    return Scaffold(
      backgroundColor: AppColors.primaryBrown,
      appBar: const AddLocationAppBar(),
      body: SingleChildScrollView(
        child: locationWatch.editAddressScreen
            ? Padding(
                padding: EdgeInsets.only(top: 20.h, left: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100.w,
                            height: 100.h,
                            color: AppColors.white,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 40.h,
                          );
                        },
                        itemCount: 3),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: HomeSearchBar(
                        hintText: AppString.keyChangeYourLocation),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        2,
                        (index) {
                          return InkWell(
                            onTap: () {
                              locationWatch.changePage(index);
                            },
                            child: Container(
                              width: 0.5.sw,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.white.withOpacity(
                                      locationWatch.selectedPage == index
                                          ? 1.0
                                          : 0.2,
                                    ),
                                    width: 8.h,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  AppString.locationTabs[index],
                                  style: TextStyles.medium.copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.white.withOpacity(
                                      locationWatch.selectedPage == index
                                          ? 1.0
                                          : 0.2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  if (locationWatch.selectedPage == 0) ...{
                    ...[
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, left: 30.w),
                        child: InkWell(
                          onTap: () {
                            ref.watch(addLocationController).isEditEnabled();
                          },
                          child: Text(
                            AppString.keyEdit,
                            style: TextStyles.medium.copyWith(
                              color: AppColors.white.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 20.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              itemCount: locationWatch.addresses.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    locationWatch.isEditAddressScreen();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: Text(
                                      locationWatch
                                          .addresses[index].addressName,
                                      style: TextStyles.medium.copyWith(
                                        color: AppColors.white,
                                        fontSize: 28.sp,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  } else ...{
                    ...[
                      Container(),
                    ]
                  }
                ],
              ),
      ),
    );
  }
}
