import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/routing/stack.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';

class LocationSaved extends ConsumerStatefulWidget {
  const LocationSaved({super.key});

  @override
  ConsumerState<LocationSaved> createState() => _LocationSavedState();
}

class _LocationSavedState extends ConsumerState<LocationSaved>
    with BaseConsumerStatefulWidget {
  @override
  Widget buildPage(BuildContext context) {
    return InkWell(
      onTap: (){
        ref.watch(navigationStackController).pop();
      },
      child: Scaffold(
        body: Center(
          child: Icon(
            Icons.check,
            size: 100.h,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
