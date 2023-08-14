import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/widgets/common_home_tab_bar.dart';

class CommonHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CommonHomeAppbar({
    super.key,
    this.isLeadingEnable = false,
    this.onLeadingPressed,
    this.backgroundColor,
    this.flexibleSpace,
    this.isFlexibleVisible = false,
  });

  final bool isLeadingEnable;
  final Function? onLeadingPressed;
  final Color? backgroundColor;
  final Widget? flexibleSpace;
  final bool isFlexibleVisible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isFlexibleVisible
          ? const EdgeInsets.all(0.0)
          : EdgeInsets.fromLTRB(30.0.w, 0.0, 30.0.w, 0.0),
      child: AppBar(
        backgroundColor: backgroundColor ?? AppColors.primaryBrown,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: flexibleSpace ?? Container(),
        bottom: isFlexibleVisible
            ? PreferredSize(
                preferredSize: const Size(1.0, 1.0), child: Container())
            : const CommonHomeTabBar(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(isFlexibleVisible ? 230 : 88.h);
}
