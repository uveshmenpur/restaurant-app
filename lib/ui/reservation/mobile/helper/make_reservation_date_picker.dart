import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation/make_reservation_controller.dart';
import 'package:restaurant/framework/utility/extension/date_time.dart';
import 'package:restaurant/ui/reservation/mobile/helper/make_reservation_date_index.dart';
import 'package:restaurant/ui/reservation/mobile/helper/make_reservation_week_day.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

///CUSTOM DATE PICKER WIDGET FOR MAKE RESERVATION SCREEN
class MakeReservationDatePicker extends ConsumerWidget with BaseConsumerWidget{
  const MakeReservationDatePicker({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final makeReservationWatch = ref.watch(makeReservationController);
    return SingleChildScrollView(
      primary: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MonthNameDisplay(
            month: now.month,
          ),
          const WeekDayList(),
          DateList(
            makeReservationWatch: makeReservationWatch,
            now: now,
            num: 0,
          ),
          MonthNameDisplay(
            month: now.month + 1,
          ),
          const WeekDayList(),
          DateList(
            makeReservationWatch: makeReservationWatch,
            now: now,
            num: 1,
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}

class DateList extends StatelessWidget with BaseStatelessWidget{
  const DateList({
    super.key,
    required this.makeReservationWatch,
    required this.now,
    required this.num,
  });

  final MakeReservationController makeReservationWatch;
  final DateTime now;
  final int num;

  @override
  Widget buildPage(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 290.h,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemCount:
            DateTime(DateTime.now().year, DateTime.now().month + num + 1, 0)
                .day,
        itemBuilder: (BuildContext context, int index) {
          int date = makeReservationWatch.dateTime.day;
          if (index + 1 >= date || num == 1) {
            return MakeReservationDateIndex(
              index: index + 1,
              makeReservationWatch: makeReservationWatch,
              horizontalMargin: 0.0,
              verticalMargin: 0.0,
              month: now.month + num,
            );
          } else {
            return MakeReservationDateIndex(
              index: index + 1,
              onItemTapped: () {},
              makeReservationWatch: makeReservationWatch,
              horizontalMargin: 0.0,
              verticalMargin: 0.0,
              fontColor: AppColors.black.withOpacity(0.3),
              month: now.month,
            );
          }
        },
      ),
    );
  }
}

/// TO DISPLAY MONTH IN DATE PICKER
class MonthNameDisplay extends StatelessWidget with BaseStatelessWidget{
  const MonthNameDisplay({
    super.key,
    required this.month,
    this.height,
  });

  final int month;
  final double? height;

  @override
  Widget buildPage(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 120.h,
      child: Center(
        child: Text(
          DateTime(2023, month).monthName,
          style: TextStyles.semiBold.copyWith(
            color: AppColors.black,
            fontSize: 24.sp,
          ),
        ),
      ),
    );
  }
}

/// TO DISPLAY WEEKDAYS LIST IN DATE PICKER
class WeekDayList extends StatelessWidget with BaseStatelessWidget{
  const WeekDayList({
    super.key,
  });

  @override
  Widget buildPage(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return MakeReservationWeekDay(index: index + 1);
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
