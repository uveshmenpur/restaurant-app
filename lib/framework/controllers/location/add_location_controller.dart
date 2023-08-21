import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant/framework/dependency_injection/inject.dart';
import 'package:restaurant/framework/repository/location/model/address.dart';

final addLocationController = ChangeNotifierProvider((ref) {
  return getIt<AddLocationController>();
});

@Injectable()
class AddLocationController extends ChangeNotifier {
  int selectedPage = 0;
  bool editEnabled = false;
  int selectedAddress = 0;
  bool editAddressScreen = false;
  final nodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  final _formKey = GlobalKey<FormState>();

  GlobalKey get formKey => _formKey;

  void changePage(int page) {
    selectedPage = page;
    notifyListeners();
  }

  void unfocus(int index) {
    nodes[index].unfocus();
    notifyListeners();
  }

  void isEditEnabled() {
    editEnabled = !editEnabled;
    notifyListeners();
  }

  void isEditAddressScreen() {
    editAddressScreen = !editAddressScreen;
    notifyListeners();
  }

  bool validate() {
    return _formKey.currentState!.validate();
  }

  void editAddress(int index, Address address) {
    addresses[index] = address;
    notifyListeners();
  }

  void removeAddress(int index) {
    addresses[index] =
        Address(addressName: addresses[index].addressName, address: '');
    notifyListeners();
  }

  /// Returns the appropriate validator function based on the field index
  String? getValidator(int index, String? value) {
    if (index == 0 && value != null) {
      if (value.length > 3) {
        return null;
      }
      return 'This Field is Mandatory';
    } else if (index == 1 && value != null) {
      if (value.length >= 15) {
        return null;
      }
      return 'This Field is Mandatory';
    } else {
      return null;
    }
  }

  List<Address> addresses = [
    Address(addressName: 'Home', address: '400/6,Astodiya,Ahmedabad-380001'),
    Address(
        addressName: 'Work',
        address:
            '2nd Floor, J Block,Mondeal Retail Park, SG High Way, Ahmedabad, 380015'),
  ];
}
