import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.toUpperCase();
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length), // Mengatur posisi kursor
    );
  }
}