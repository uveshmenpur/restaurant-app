import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';
import 'package:restaurant/ui/utils/widgets/common_close_button.dart';

class MakeReservationCloseButton extends StatelessWidget with BaseStatelessWidget{
  const MakeReservationCloseButton({
    super.key,
  });

  @override
  Widget buildPage(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(),
        ),
        const CommonCloseButton(),
        SizedBox(
          width: 30.w,
        ),
      ],
    );
  }
}
