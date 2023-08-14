import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

///Card that Displays Restaurant Information
class RestaurantDetailsCard extends StatelessWidget {
  const RestaurantDetailsCard({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      width: double.infinity,
      color: AppColors.restaurantCard,
      child: Column(
        children: [
          const Spacer(),
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
                  restaurant.rating.toString(),
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
            restaurant.restaurantName,
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
            restaurant.category,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyles.medium.copyWith(
              fontSize: 16.sp,
              color: AppColors.black.withOpacity(0.7),
            ),
          ),
          const Spacer(flex: 3,),
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
                  restaurant.distance.toString(),
                  style: TextStyles.regular.copyWith(
                    color: AppColors.black.withOpacity(0.8),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      restaurant.price,
                      style: TextStyles.medium.copyWith(
                        color: AppColors.black.withOpacity(0.7),
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
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
                  restaurant.comments.toString(),
                  style: TextStyles.medium.copyWith(
                    color: AppColors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}