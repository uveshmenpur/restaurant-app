import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/restaurant_details/mobile/helper/person_profile.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

class RestaurantReview extends StatelessWidget with BaseStatelessWidget{
  const RestaurantReview(
      {super.key, this.hasTitle = false, required this.name});

  final bool hasTitle;
  final String name;

  @override
  Widget buildPage(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 45.w,
                height: 30.h,
              ),
              const PersonProfile(size: 40)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              hasTitle
                  ? Text(
                      AppString.keyHighlightedReviews,
                      style: TextStyles.bold.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.reviewTextColor,
                      ),
                    )
                  : Text(
                      '',
                      style: TextStyles.bold.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.reviewTextColor,
                      ),
                    ),
              Divider(
                thickness: 2.h,
                color: AppColors.black.withOpacity(1.0),
              ),
              Text(
                name,
                style: TextStyles.bold.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.black,
                ),
              ),
              Text(
                AppString.key198Reviews,
                style: TextStyles.regular.copyWith(
                  color: AppColors.reviewTextColor,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                    decoration: BoxDecoration(
                      color: AppColors.restaurantOpenColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15.h),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 12.h,
                          color: AppColors.white,
                        ),
                        Text(
                          ' 4',
                          style: TextStyles.semiBold.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    AppString.key8DaysAgo,
                    style: TextStyles.medium.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.reviewCommentTimeColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 250.w,
                height: 90.h,
                child: Text(
                  AppString.keyReviewText,
                  maxLines: 6,
                  softWrap: true,
                  style: TextStyles.medium.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.reviewTextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
