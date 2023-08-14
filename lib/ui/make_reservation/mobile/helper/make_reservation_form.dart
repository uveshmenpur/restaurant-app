import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation/make_reservation_controller.dart';
import 'package:restaurant/framework/controllers/make_reservation/make_reservation_form_controller.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/framework/utility/extension/string.dart';
import 'package:restaurant/ui/restaurant_details/mobile/helper/make_reservation_button.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';
import 'package:restaurant/ui/utils/widgets/common_text_field.dart';

class MakeReservationForm extends ConsumerWidget {
  const MakeReservationForm({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final makeReservationWatch = ref.watch(makeReservationController);
    final makeReservationFormWatch = ref.watch(makeReservationFormController);
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
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                makeReservationFormWatch.assignNodes();
                return CommonTextField(
                    index: index,
                    makeReservationFormWatch: makeReservationFormWatch,
                    maxLength: index == 2 ? 10 : null,
                    // prefix: index == 2
                    //     ?
                    //     : null,
                    // // prefixText: index == 2 ? '${makeReservationFormWatch.code.dialCode} ' : null,
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
                                CountryCodePicker(
                                  hideMainText: true,
                                  showCountryOnly: true,
                                  showFlagMain: true,
                                  onChanged: (code) {
                                    makeReservationFormWatch
                                        .changeCountryCode(code);
                                  },

                                  alignLeft: true,
                                  padding: EdgeInsets.zero,
                                ),
                                // Padding(
                                //   padding: EdgeInsets.fromLTRB(4.w, 0.0,0.0, 15.h),
                                //   child: Icon(
                                //     Icons.keyboard_arrow_down,
                                //     size: 18.w,
                                //     color: AppColors.selectedPageIndicatorColor,
                                //   ),
                                // ),
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
                    validator: index == 2
                        ? (value) {
                            if (value != null &&
                                value.length == 10 &&
                                value.validatePhoneNumber) {
                              makeReservationFormWatch.phoneNumber = value;
                              return null;
                            } else {
                              return '  Invalid Phone';
                            }
                          }
                        : index == 3
                            ? (value) {
                                if (value != null && value.validateEmail) {
                                  makeReservationFormWatch.email = value;
                                  return null;
                                } else {
                                  return 'Enter Valid Email';
                                }
                              }
                            : (value) {
                                if (value != null && value.isNotEmpty ||
                                    index == 4) {
                                  if (index == 0) {
                                    makeReservationFormWatch.firstName = value!;
                                  }
                                  if (index == 1) {
                                    makeReservationFormWatch.lastname = value!;
                                  }
                                  if (index == 4) {
                                    makeReservationFormWatch.specialRequest =
                                        value;
                                  }
                                  return null;
                                } else {
                                  return 'Invalid Input';
                                }
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
              makeReservationFormWatch.validate();
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
