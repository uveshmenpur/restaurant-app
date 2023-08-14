import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant/framework/dependency_injection/inject.dart';
import 'package:restaurant/framework/utility/extension/date_time.dart';

final makeReservationController = ChangeNotifierProvider((ref) {
  return getIt<MakeReservationController>();
});

@Injectable()
class MakeReservationController extends ChangeNotifier {
  ///All the reservation related date,time,weekday is manages in this controller
  DateTime dateTime = DateTime.now();
  int selectedDay = DateTime.now().day;
  int selectedMonth = DateTime.now().month;
  int selectedPage = 1;
  String selectedTime = '13:00';
  String selectedReservationTime = '';
  int daysLeftInMonth =
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day -
          DateTime.now().day;
  int daysInMonth =
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
  int selectedPersonCount = 0;
  int reservationTime = 0;


  String weekDayByDate() {
    return DateTime(DateTime.now().year, selectedMonth, selectedDay)
        .weekdayName;
  }

  void setTime(String newTime) {
    selectedTime = newTime;
    notifyListeners();
  }

  void setReservationTime(int newTime) {
    reservationTime = newTime;
    notifyListeners();
  }

  void setSelectedReservationTime() {
    selectedReservationTime =
        '${weekDayByDate()},$selectedDay,${DateTime(dateTime.year, selectedMonth).monthName},$reservationTime';
    notifyListeners();
  }

  void selectPerson(int newCount) {
    selectedPersonCount = newCount;
    notifyListeners();
  }

  void selectDate(int newDate, int newMonth) {
    selectedDay = newDate;
    selectedMonth = newMonth;
    notifyListeners();
  }

  void jumpToPage(int newPage) {
    selectedPage = newPage;
    notifyListeners();
  }
}
