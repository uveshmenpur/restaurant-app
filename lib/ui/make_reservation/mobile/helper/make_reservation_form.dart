import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation/make_reservation_controller.dart';
import 'package:restaurant/framework/controllers/make_reservation/make_reservation_form_controller.dart';
import 'package:restaurant/framework/controllers/make_reservation/reservation_confirmation_controller.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/framework/repository/make_reservation/model/reservation.dart';
import 'package:restaurant/ui/restaurant_details/mobile/helper/make_reservation_button.dart';
import 'package:restaurant/ui/routing/navigation_stack_item.dart';
import 'package:restaurant/ui/routing/stack.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';
import 'package:restaurant/ui/utils/widgets/common_text_field.dart';

class MakeReservationForm extends ConsumerWidget with BaseConsumerWidget {
  const MakeReservationForm({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    final makeReservationWatch = ref.watch(makeReservationController);
    final makeReservationFormWatch = ref.watch(makeReservationFormController);
    final reservationConfirmedWatch = ref.watch(reservationConfirmedController);
    return Form(
      key: makeReservationFormWatch.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10.h,
            width: double.infinity,
          ),
          Icon(
            Icons.watch_later_outlined,
            size: 14.h,
            color: AppColors.selectedPageIndicatorColor,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            makeReservationWatch.selectedTime,
            style: TextStyles.bold.copyWith(
              fontSize: 16.sp,
              color: AppColors.selectedPageIndicatorColor,
            ),
          ),
          Divider(
            color: AppColors.selectedPageIndicatorColor.withOpacity(0.4),
          ),
          SizedBox(
            height: 430.h,
            child: ListView.builder(
              itemCount: 5,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                makeReservationFormWatch.assignNodes();
                return CommonTextField(
                    index: index,
                    controller: makeReservationFormWatch,
                    maxLength: index == 2 ? 10 : null,
                    keyboard: index == 2
                        ? TextInputType.phone
                        : index == 3
                            ? TextInputType.emailAddress
                            : TextInputType.text,
                    contentPadding: index == 2
                        ? EdgeInsets.fromLTRB(0.w, 30.h, 0.0, 10.h)
                        : null,
                    prefixIcon: index == 2
                        ? SizedBox(
                            height: 60.h,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const CountryPicker(),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 25.h, 0.0, 8.h),
                                  child: Text(
                                    '${makeReservationFormWatch.code.dialCode} ',
                                    style: TextStyles.medium.copyWith(
                                      fontSize: 18.sp,
                                      color:
                                          AppColors.selectedPageIndicatorColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : null,
                    validator: (value) {
                      return makeReservationFormWatch.getValidator(
                        index,
                        value,
                      );
                    },
                    node: makeReservationFormWatch.nodes[index]);
              },
            ),
          ),
          Expanded(
            child: Container(),
          ),
          MakeReservationButton(
            onTap: () {
              final reservation = Reservation(
                restaurant: restaurant,
                reservationTime: makeReservationWatch.selectedReservationTime,
                peopleCount: makeReservationWatch.selectedPersonCount,
              );
              if(makeReservationFormWatch.validate()){
                makeReservationWatch.setSelectedReservationTime();
                reservationConfirmedWatch.reservations.add(reservation);
                reservationConfirmedWatch.filterLists();
                reservationConfirmedWatch.setReservation(reservation);
                ref.watch(navigationStackController).push(
                  NavigationStackItem.reservationConfirmed(reservation),
                );
              }
            },
          ),
          Flexible(
            child: SizedBox(
              height: 60.h,
            ),
          ),
        ],
      ),
    );
  }
}

class CountryPicker extends StatelessWidget {
  const CountryPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final makeReservationFormWatch =
            ref.watch(makeReservationFormController);
        return CountryCodePicker(
          hideMainText: true,
          showCountryOnly: true,
          showFlagMain: true,
          onChanged: (code) {
            makeReservationFormWatch.changeCountryCode(code);
          },
          alignLeft: true,
          padding: EdgeInsets.zero,
        );
      },
    );
  }
}
