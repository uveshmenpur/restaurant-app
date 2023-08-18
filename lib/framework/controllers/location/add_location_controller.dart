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
  bool editAddressScreen = false;

  void changePage(int page) {
    selectedPage = page;
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

  void editAddress(int index, Address address) {
    addresses[index] = address;
    notifyListeners();
  }

  void removeAddress(int index) {
    addresses[index] = Address(addressName: '', address: '');
    notifyListeners();
  }

  List<Address> addresses = [
    Address(addressName: 'Home', address: '400/6,Astodiya,Ahmedabad-380001'),
    Address(
        addressName: 'Work',
        address:
            '2nd Floor, J Block,Mondeal Retail Park, SG High Way, Ahmedabad, 380015'),
  ];
}
