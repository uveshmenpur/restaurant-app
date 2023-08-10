import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation_controller.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/ui/make_reservation/mobile/helper/make_reservation_close_button.dart';
import 'package:restaurant/ui/make_reservation/mobile/helper/make_reservation_date_picker.dart';
import 'package:restaurant/ui/make_reservation/mobile/helper/make_reservation_tab_bar.dart';
import 'package:restaurant/ui/make_reservation/mobile/helper/make_reservation_title.dart';
import 'package:restaurant/ui/make_reservation/mobile/helper/select_person_page.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';

class MakeReservationMobile extends StatelessWidget {
  const MakeReservationMobile({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.makeReservationBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 54.h,
            ),
            const MakeReservationCloseButton(),
            const MakeReservationTitle(
              title: AppString.keyMakeAReservation,
            ),
            const MakeReservationTabBar(),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final makeReservationWatch = ref.watch(makeReservationController);
                return makeReservationWatch.selectedPage == 1 ? const SelectPersonPage() : const MakeReservationDatePicker();
              },
            ),
          ],
        ),
      ),
    );
  }
}
