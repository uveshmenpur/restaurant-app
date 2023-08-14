extension NumericCheck on String? {
  bool get validatePhoneNumber {
    if (this == null) {
      return false;
    }
    final numericRegEx = RegExp(r'^[0-9]+$');
    return numericRegEx.hasMatch(this!.trim());
  }
  bool get validateEmail {
    if (this == null) {
      return false;
    }

    final emailRegEx = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
    );

    return emailRegEx.hasMatch(this!);
  }
}