import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/card_micro_border_button.dart';

class Card2MicroBorderButton extends StatelessWidget {
  final VoidCallback onClicked1, onClicked2;
  final Color colorButton1, colorButton2;
  final bool statusOnClick1, statusOnClick2;
  final String textButton1, textButton2;
  const Card2MicroBorderButton({super.key,
    required this.onClicked1,
    required this.onClicked2,
    required this.colorButton1,
    required this.colorButton2,
    required this.statusOnClick1,
    required this.statusOnClick2,
    required this.textButton1,
    required this.textButton2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: (statusOnClick1 == true) ? 2 : 1,
          child: CardMicroBorderButton(
            sizeFont: (statusOnClick1 == true) ? 15 : 10,
            textButton: textButton1,
            onClicked: onClicked1,
            colorButton: colorButton1, 
            statusOnClick: statusOnClick1,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          flex: (statusOnClick2 == true) ? 2 : 1,
          child: CardMicroBorderButton(
            sizeFont: (statusOnClick2 == true) ? 15 : 10,
            textButton: textButton2,
            onClicked: onClicked2,
            colorButton: colorButton2,
            statusOnClick: statusOnClick2,
          ),
        ),
      ],
    );
  }
}