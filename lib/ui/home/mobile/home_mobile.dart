import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/framework/controllers/home/home_controller.dart';
import 'package:restaurant/ui/home/mobile/helper/home_body_widget.dart';
import 'package:restaurant/ui/home/mobile/helper/home_covid_banner.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/widgets/common_home_app_bar.dart';

class HomeMobile extends ConsumerWidget with BaseConsumerWidget{
  const HomeMobile({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {

    /// Watch the home controller for changes
    final homeWatch = ref.watch(homeController);

    return Scaffold(

      ///Common Appbar
      appBar: CommonHomeAppbar(

        /// Display Covid Banner on App Start
        flexibleSpace: const HomeCovidBanner(),
        isFlexibleVisible: homeWatch.isBannerVisible,
      ),
      backgroundColor: AppColors.primaryBrown,
      body: HomeBodyWidget(
        ref: ref,
      ),
    );
  }
}