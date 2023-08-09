import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.image,
    required this.rating,
    required this.restaurantName,
    required this.distance,
    required this.commentCount,
    required this.restaurantCategory, required this.price,
  });

  final String image;
  final String rating;
  final String restaurantName;
  final String distance;
  final String restaurantCategory;
  final String commentCount;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
      child: Stack(
        fit: StackFit.loose,
        children: [
          SizedBox(
            height: 390.h,
          ),
          SizedBox(
            height: 310.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 310.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            height: 160.h,
            top: 230.h,
            width: 0.95.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 294.w,
                  child: Card(
                    color: AppColors.restaurantCard,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0.w, vertical: 4.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                size: 14.0.w,
                              ),
                              Text(
                                rating,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.regular.copyWith(
                                  color: AppColors.black.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          restaurantName,
                          softWrap: true,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.semiBold.copyWith(
                            fontSize: 22.sp,
                            color: AppColors.black,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          restaurantCategory,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyles.regular.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.black.withOpacity(0.7),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.black,
                                size: 14.w,
                              ),
                              Text(
                                distance,
                                style: TextStyles.regular.copyWith(
                                  color: AppColors.black.withOpacity(0.8),
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                child: Text(
                                  AppString.keyThreeDollars,
                                  style: TextStyles.medium.copyWith(
                                    color: AppColors.black.withOpacity(0.7),
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Icon(
                                  Icons.mode_comment_outlined,
                                  color: AppColors.black,
                                  size: 14.w,
                                ),
                              ),
                              Text(
                                commentCount,
                                style: TextStyles.medium.copyWith(
                                  color: AppColors.black.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
