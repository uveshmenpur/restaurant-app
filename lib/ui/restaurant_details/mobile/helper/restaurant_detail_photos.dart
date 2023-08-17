import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_assets.dart';

///Restaurant Images in Restaurant Details page
class RestaurantDetailPhotos extends StatelessWidget with BaseStatelessWidget{
  const RestaurantDetailPhotos({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: [
        ...List.generate(AppAssets.foodItems.length, (index) {
          return Image.asset(
            AppAssets.foodItems[index],
            width: 138.w,
            height: 138.h,
            fit: BoxFit.fill,
          );
        })
      ],
    );
  }
}
