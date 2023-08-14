import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/home/home_controller.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/ui/routing/stack.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';


class RestaurantDetailsTopWidget extends StatelessWidget {
  const RestaurantDetailsTopWidget({
    super.key,
    required this.restaurant,
  });
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 320.h,
      child: Stack(
        children: [
          Image.asset(
            restaurant.imageUrl,
            width: double.infinity,
            height: 320.h,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 54.h,
            right: 30.w,
            child: Consumer(
              builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                return InkWell(
                  onTap: () {
                    ref.watch(navigationStackController).pop();
                  },
                  child: Text(
                    AppString.keyClose,
                    style: TextStyles.regular.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            child: Consumer(
              builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                final homeWatch = ref.watch(homeController);
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          if (homeWatch.favorite.contains(restaurant)) {
                            homeWatch.removeFavourite(restaurant);
                            restaurant.isFavorite = true;
                          } else {
                            homeWatch.addFavourite(restaurant);
                            restaurant.isFavorite = false;
                          }
                        },
                        child: Icon(
                          homeWatch.favorite.contains(restaurant)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: homeWatch.favorite.contains(restaurant)
                              ? Colors.red
                              : AppColors.white.withOpacity(0.6),
                          size: 20.w,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.ios_share,
                          color: AppColors.white.withOpacity(0.6),
                          size: 20.w,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}