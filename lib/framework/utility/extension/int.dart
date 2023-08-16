import 'dart:math';

extension WeekdayFromInt on int {
  String get weekDay {
    switch (this) {
      case 1:
        return 'M';
      case 2:
      case 4:
        return 'T';
      case 3:
        return 'W';
      case 5:
        return 'F';
      case 6:
      case 7:
        return 'S';
      default:
        return ' ';
    }
  }

  String get monthName {
    switch (this) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'Aug';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  String get generateUniqueId {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final uniqueChars =
        List.generate(this, (index) => chars[random.nextInt(chars.length)]);
    return uniqueChars.join('');
  }
}
