// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/card_micro_border_button.dart';

class Card3MicroBorderButton extends StatelessWidget {
  final VoidCallback onClicked1, onClicked2, onClicked3;
  final Color colorButton1, colorButton2, colorButton3;
  final bool statusOnClick1, statusOnClick2, statusOnClick3;
  final String textButton1, textButton2, textButton3;
  late double sizeFont;
  Card3MicroBorderButton({super.key,
    this.sizeFont = 10.0,
    required this.onClicked1,
    required this.onClicked2,
    required this.onClicked3,
    required this.colorButton1,
    required this.colorButton2,
    required this.colorButton3,
    required this.statusOnClick1,
    required this.statusOnClick2,
    required this.statusOnClick3,
    required this.textButton1,
    required this.textButton2,
    required this.textButton3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CardMicroBorderButton(
            sizeFont: sizeFont,
            textButton: textButton1,
            onClicked: onClicked1,
            colorButton: colorButton1, 
            statusOnClick: statusOnClick1,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: CardMicroBorderButton(
            sizeFont: sizeFont,
            textButton: textButton2,
            onClicked: onClicked2,
            colorButton: colorButton2,
            statusOnClick: statusOnClick2,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: CardMicroBorderButton(
            sizeFont: sizeFont,
            textButton: textButton3,
            onClicked: onClicked3,
            colorButton: colorButton3,
            statusOnClick: statusOnClick3,
          ),
        ),
      ],
    );
  }
}