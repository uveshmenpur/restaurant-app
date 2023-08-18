// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:restaurant/framework/controllers/home/home_controller.dart'
    as _i4;
import 'package:restaurant/framework/controllers/location/add_location_controller.dart'
    as _i3;
import 'package:restaurant/framework/controllers/make_reservation/make_reservation_controller.dart'
    as _i10;
import 'package:restaurant/framework/controllers/make_reservation/make_reservation_form_controller.dart'
    as _i11;
import 'package:restaurant/framework/controllers/make_reservation/reservation_confirmation_controller.dart'
    as _i13;
import 'package:restaurant/framework/controllers/restaurant_details/restaurant_details_controller.dart'
    as _i14;
import 'package:restaurant/ui/routing/delegate.dart' as _i5;
import 'package:restaurant/ui/routing/navigation_stack_item.dart' as _i12;
import 'package:restaurant/ui/routing/parser.dart' as _i7;
import 'package:restaurant/ui/routing/stack.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AddLocationController>(() => _i3.AddLocationController());
    gh.factory<_i4.HomeController>(() => _i4.HomeController());
    gh.factoryParam<_i5.MainRouterDelegate, _i6.NavigationStack, dynamic>((
      stack,
      _,
    ) =>
        _i5.MainRouterDelegate(stack));
    gh.factoryParam<_i7.MainRouterInformationParser, _i8.WidgetRef,
        _i9.BuildContext>((
      ref,
      context,
    ) =>
        _i7.MainRouterInformationParser(
          ref,
          context,
        ));
    gh.factory<_i10.MakeReservationController>(
        () => _i10.MakeReservationController());
    gh.factory<_i11.MakeReservationFormController>(
        () => _i11.MakeReservationFormController());
    gh.factoryParam<_i6.NavigationStack, List<_i12.NavigationStackItem>,
        dynamic>((
      items,
      _,
    ) =>
        _i6.NavigationStack(items));
    gh.factory<_i13.ReservationConfirmedController>(
        () => _i13.ReservationConfirmedController());
    gh.factory<_i14.RestaurantDetailsController>(
        () => _i14.RestaurantDetailsController());
    return this;
  }
}
