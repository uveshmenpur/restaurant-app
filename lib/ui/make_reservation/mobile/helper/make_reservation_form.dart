import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/framework/controllers/make_reservation_controller.dart';
import 'package:restaurant/framework/controllers/make_reservation_form_controller.dart';
import 'package:restaurant/framework/repository/home/model/restaurant.dart';
import 'package:restaurant/ui/utils/const/app_strings.dart';
import 'package:restaurant/ui/utils/theme/app_colors.dart';
import 'package:restaurant/ui/utils/theme/text_style.dart';

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
            height: 400.h,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                makeReservationFormWatch.assignNodes();
                return CommonTextField(
                  index: index,
                  makeReservationFormWatch: makeReservationFormWatch,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.makeReservationFormWatch,
    required this.index, this.validator,
  });

  final MakeReservationFormController makeReservationFormWatch;
  final int index;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: makeReservationFormWatch.nodes[index],
      decoration: InputDecoration(
        hintText: AppString.inputHint[index],
        hintStyle: TextStyles.medium.copyWith(
          fontSize: 18.sp,
          color: makeReservationFormWatch.nodes[index].hasFocus
              ? AppColors.selectedPageIndicatorColor.withOpacity(0.4)
              : AppColors.selectedPageIndicatorColor,
        ),
        contentPadding: EdgeInsets.fromLTRB(30.w,30.h,0.0,10.h),
      ),
      onTapOutside: (pointer){
        makeReservationFormWatch.nodes[index].unfocus();
      },
      onSaved: (value){
        makeReservationFormWatch.validate();
      },
      textInputAction: TextInputAction.next,
    );
  }
}
