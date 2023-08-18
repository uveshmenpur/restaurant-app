import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:restaurant/ui/location/mobile/add_location_mobile.dart';
import 'package:restaurant/ui/utils/helpers/base.dart';


class AddLocation extends StatelessWidget with BaseStatelessWidget {
  const AddLocation({Key? key}) : super(key: key);

  ///Build Override
  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return const AddLocationMobile();
        },
        desktop: (BuildContext context) {
          return const AddLocationMobile();
        }
    );
  }
}