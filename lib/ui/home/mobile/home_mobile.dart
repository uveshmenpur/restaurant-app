import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/home_controller.dart';
import 'package:restaurant/ui/home/mobile/helper/home_covid_banner.dart';
import 'package:restaurant/ui/home/mobile/helper/home_filter_restaurant.dart';
import 'package:restaurant/ui/home/mobile/helper/home_search_bar.dart';
import 'package:restaurant/ui/routing/navigation_stack_item.dart';
import 'package:restaurant/ui/routing/stack.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';
import 'package:restaurant/ui/utils/widgets/common_home_appbar.dart';
import 'package:restaurant/ui/utils/widgets/restaurant_card.dart';

class HomeMobile extends ConsumerWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeWatch = ref.watch(homeController);
    return Scaffold(
      ///Common Appbar
      appBar: CommonHomeAppbar(
        ///Used to display Covid Banner on App Start
        flexibleSpace: const HomeCovidBanner(),
        isFlexibleVisible: homeWatch.isBannerVisible,
      ),
      backgroundColor: AppColors.primaryBrown,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 22.h),
              child: Icon(
                Icons.location_on,
                color: AppColors.white.withOpacity(0.6),
                size: 16.0.w,
              ),
            ),
            //TODO implement onTap method
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.keyThomson,
                    style: TextStyles.regular.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.0.h),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 12.0.w,
                      color: AppColors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            const HomeSearchBar(),
            InkWell(
              onTap: () {
                homeWatch.changeFilter();
              },
              child: Text(
                AppString.keyFilter,
                style: TextStyles.regular.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            const HomeFilterRestaurant(),
            ...List.generate(
              homeWatch.restaurants.length,
              (index) {
                final restaurant = homeWatch.restaurants[index];
                return InkWell(
                  onTap: () {
                    ref.watch(navigationStackController).push(
                        NavigationStackItem.restaurantDetails(restaurant));
                  },
                  child: RestaurantCard(
                    image: restaurant.imageUrl,
                    rating: restaurant.rating.toString(),
                    restaurantName: restaurant.restaurantName,
                    distance: '${restaurant.distance} km',
                    commentCount: restaurant.comments.toString(),
                    restaurantCategory: restaurant.category,
                    price: restaurant.price,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
