extension WeekdayFromInt on int{
  String get weekDay{
    switch(this){
      case 1:
        return ' M';
      case 2:
      case 4:
        return ' T';
      case 3:
        return ' W';
      case 5:
        return ' F';
      case 6:
      case 7:
        return ' S';
      default:
        return '  ';
    }
  }
}