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
  DateTime selected = DateTime.now();
  int selectedDay = DateTime.now().day;
  int selectedMonth = DateTime.now().month;
  int selectedPage = 1;
  String selectedTime = '13:00';
  DateTime selectedReservationTime = DateTime.now();
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

  ///Manages BreakFast, Lunch And Dinner
  void setTime(String newTime) {
    selectedTime = newTime;
    notifyListeners();
  }

  ///Manages BreakFast, Lunch And Dinner TabBar
  void setReservationTime(int newTime) {
    reservationTime = newTime;
    notifyListeners();
  }

  ///Setting Reservation Time
  void setSelectedReservationTime() {
    selectedReservationTime = DateTime.parse(
        '${DateTime.now().year}-${selectedMonth > 9 ? selectedMonth : '0$selectedMonth'}-${selectedDay > 9 ? selectedDay : '0$selectedDay'} $selectedTime');
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
