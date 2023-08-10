import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation_controller.dart';
import 'package:restaurant/ui/make_reservation/mobile/helper/make_reservation_index.dart';

class SelectPersonPage extends StatelessWidget {
  const SelectPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 20.h,
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final makeReservationWatch = ref.watch(makeReservationController);
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemCount: 15,
              itemBuilder: (context, index) {
                return MakeReservationIndex(
                  index: index + 1,
                  makeReservationWatch: makeReservationWatch,
                  horizontalPadding: 0.0,
                  verticalPadding: 0.0,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
