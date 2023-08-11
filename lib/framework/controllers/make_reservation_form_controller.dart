import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant/framework/dependency_injection/inject.dart';

final makeReservationFormController = ChangeNotifierProvider((ref) {
  return getIt<MakeReservationFormController>();
});

@Injectable()
class MakeReservationFormController extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode phoneNumberNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode specialRequestNode = FocusNode();

  List<FocusNode> nodes = [];

  void assignNodes() {
    nodes = [
      firstNameNode,
      lastNameNode,
      phoneNumberNode,
      emailNode,
      specialRequestNode,
    ];
  }

  String firstName = '';
  String lastname = '';
  String phoneNumber = '';
  String email = '';
  String specialRequest = '';

  GlobalKey get formKey => _formKey;

  void validate() {
    _formKey.currentState?.validate();
    notify();
  }
  void notify(){
    notifyListeners();
  }
}
