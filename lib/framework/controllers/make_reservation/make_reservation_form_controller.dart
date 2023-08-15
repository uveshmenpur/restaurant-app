import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant/framework/dependency_injection/inject.dart';
import 'package:restaurant/framework/utility/extension/string.dart';

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
  CountryCode code = CountryCode(name: 'Saudi Arab',flagUri: '',code: 'ABC',dialCode: '+91');

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

  String _firstName = '';
  String _lastname = '';
  String _phoneNumber = '';
  String _email = '';
  String? _specialRequest = '';

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  // Returns the appropriate validator function based on the field index
  String? Function(String?)? getValidator(
      int index) {
    if (index == 2) {
      return (value) {
        if (value != null && value.length == 10 && value.validatePhoneNumber) {
          _phoneNumber = value;
          return null;
        } else {
          return 'Invalid Phone';
        }
      };
    } else if (index == 3) {
      return (value) {
        if (value != null && value.validateEmail) {
          _email = value;
          return null;
        } else {
          return 'Enter Valid Email';
        }
      };
    } else {
      return (value) {
        if (value != null && (value.isNotEmpty || index == 4)) {
          if (index == 0) {
            _firstName = value;
          } else if (index == 1) {
            _lastname = value;
          } else if (index == 4) {
            _specialRequest = value;
          }
          return null;
        } else {
          return 'Invalid Input';
        }
      };
    }
  }

  GlobalKey get formKey => _formKey;

  void changeCountryCode(CountryCode code){
    this.code = code;
    notify();
  }
  void validate() {
    _formKey.currentState?.validate();
    notify();
  }
  void notify(){
    notifyListeners();
  }

  String get lastname => _lastname;

  set lastname(String value) {
    _lastname = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String? get specialRequest => _specialRequest;

  set specialRequest(String? value) {
    _specialRequest = value;
  }
}
