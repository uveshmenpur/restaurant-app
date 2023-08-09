// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_stack_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationStackItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function(Restaurant restaurant) restaurantDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function(Restaurant restaurant)? restaurantDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(Restaurant restaurant)? restaurantDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationStackItemHome value) home,
    required TResult Function(NavigationStackItemRestaurantDetails value)
        restaurantDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavigationStackItemHome value)? home,
    TResult? Function(NavigationStackItemRestaurantDetails value)?
        restaurantDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationStackItemHome value)? home,
    TResult Function(NavigationStackItemRestaurantDetails value)?
        restaurantDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStackItemCopyWith<$Res> {
  factory $NavigationStackItemCopyWith(
          NavigationStackItem value, $Res Function(NavigationStackItem) then) =
      _$NavigationStackItemCopyWithImpl<$Res, NavigationStackItem>;
}

/// @nodoc
class _$NavigationStackItemCopyWithImpl<$Res, $Val extends NavigationStackItem>
    implements $NavigationStackItemCopyWith<$Res> {
  _$NavigationStackItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NavigationStackItemHomeCopyWith<$Res> {
  factory _$$NavigationStackItemHomeCopyWith(_$NavigationStackItemHome value,
          $Res Function(_$NavigationStackItemHome) then) =
      __$$NavigationStackItemHomeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NavigationStackItemHomeCopyWithImpl<$Res>
    extends _$NavigationStackItemCopyWithImpl<$Res, _$NavigationStackItemHome>
    implements _$$NavigationStackItemHomeCopyWith<$Res> {
  __$$NavigationStackItemHomeCopyWithImpl(_$NavigationStackItemHome _value,
      $Res Function(_$NavigationStackItemHome) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NavigationStackItemHome implements NavigationStackItemHome {
  const _$NavigationStackItemHome();

  @override
  String toString() {
    return 'NavigationStackItem.home()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationStackItemHome);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function(Restaurant restaurant) restaurantDetails,
  }) {
    return home();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function(Restaurant restaurant)? restaurantDetails,
  }) {
    return home?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(Restaurant restaurant)? restaurantDetails,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationStackItemHome value) home,
    required TResult Function(NavigationStackItemRestaurantDetails value)
        restaurantDetails,
  }) {
    return home(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavigationStackItemHome value)? home,
    TResult? Function(NavigationStackItemRestaurantDetails value)?
        restaurantDetails,
  }) {
    return home?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationStackItemHome value)? home,
    TResult Function(NavigationStackItemRestaurantDetails value)?
        restaurantDetails,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(this);
    }
    return orElse();
  }
}

abstract class NavigationStackItemHome implements NavigationStackItem {
  const factory NavigationStackItemHome() = _$NavigationStackItemHome;
}

/// @nodoc
abstract class _$$NavigationStackItemRestaurantDetailsCopyWith<$Res> {
  factory _$$NavigationStackItemRestaurantDetailsCopyWith(
          _$NavigationStackItemRestaurantDetails value,
          $Res Function(_$NavigationStackItemRestaurantDetails) then) =
      __$$NavigationStackItemRestaurantDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({Restaurant restaurant});
}

/// @nodoc
class __$$NavigationStackItemRestaurantDetailsCopyWithImpl<$Res>
    extends _$NavigationStackItemCopyWithImpl<$Res,
        _$NavigationStackItemRestaurantDetails>
    implements _$$NavigationStackItemRestaurantDetailsCopyWith<$Res> {
  __$$NavigationStackItemRestaurantDetailsCopyWithImpl(
      _$NavigationStackItemRestaurantDetails _value,
      $Res Function(_$NavigationStackItemRestaurantDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurant = null,
  }) {
    return _then(_$NavigationStackItemRestaurantDetails(
      null == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant,
    ));
  }
}

/// @nodoc

class _$NavigationStackItemRestaurantDetails
    implements NavigationStackItemRestaurantDetails {
  const _$NavigationStackItemRestaurantDetails(this.restaurant);

  @override
  final Restaurant restaurant;

  @override
  String toString() {
    return 'NavigationStackItem.restaurantDetails(restaurant: $restaurant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationStackItemRestaurantDetails &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, restaurant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationStackItemRestaurantDetailsCopyWith<
          _$NavigationStackItemRestaurantDetails>
      get copyWith => __$$NavigationStackItemRestaurantDetailsCopyWithImpl<
          _$NavigationStackItemRestaurantDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function(Restaurant restaurant) restaurantDetails,
  }) {
    return restaurantDetails(restaurant);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function(Restaurant restaurant)? restaurantDetails,
  }) {
    return restaurantDetails?.call(restaurant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(Restaurant restaurant)? restaurantDetails,
    required TResult orElse(),
  }) {
    if (restaurantDetails != null) {
      return restaurantDetails(restaurant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationStackItemHome value) home,
    required TResult Function(NavigationStackItemRestaurantDetails value)
        restaurantDetails,
  }) {
    return restaurantDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavigationStackItemHome value)? home,
    TResult? Function(NavigationStackItemRestaurantDetails value)?
        restaurantDetails,
  }) {
    return restaurantDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationStackItemHome value)? home,
    TResult Function(NavigationStackItemRestaurantDetails value)?
        restaurantDetails,
    required TResult orElse(),
  }) {
    if (restaurantDetails != null) {
      return restaurantDetails(this);
    }
    return orElse();
  }
}

abstract class NavigationStackItemRestaurantDetails
    implements NavigationStackItem {
  const factory NavigationStackItemRestaurantDetails(
      final Restaurant restaurant) = _$NavigationStackItemRestaurantDetails;

  Restaurant get restaurant;
  @JsonKey(ignore: true)
  _$$NavigationStackItemRestaurantDetailsCopyWith<
          _$NavigationStackItemRestaurantDetails>
      get copyWith => throw _privateConstructorUsedError;
}
