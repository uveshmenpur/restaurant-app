import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant/framework/dependency_injection/inject.dart';

final makeReservationController = ChangeNotifierProvider((ref) {
  return getIt<MakeReservationController>();
});

@Injectable()
class MakeReservationController extends ChangeNotifier{

  DateTime dateTime = DateTime.now();
  DateTime selectedDate = DateTime.now();
  int selectedDay = DateTime.now().day;
  int selectedMonth = DateTime.now().month;
  int selectedPage = 0;
  int daysLeftInMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day - DateTime.now().day;
  int daysInMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
  int selectedPersonCount = 0;

  void selectPerson(int newCount){
    selectedPersonCount = newCount;
    notifyListeners();
  }
  void selectDate(int newDate,int newMonth){
    selectedDay = newDate;
    selectedMonth = newMonth;
    notifyListeners();
  }

  void jumpToPage(int newPage){
    if(newPage < 3){
      selectedPage = newPage;
    }else{
      selectedPage = 0;
    }
    notifyListeners();
  }

}