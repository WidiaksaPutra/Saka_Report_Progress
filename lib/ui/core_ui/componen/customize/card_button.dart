// ignore_for_file: use_super_parameters, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class CardButton extends StatelessWidget {
  late VoidCallback onClicked;
  late bool isLoading;
  late Color buttonColor;
  final String textButton;
  final double sizeFont;
  CardButton({
    Key? key,
    this.buttonColor = kPrimaryColor,
    required this.onClicked,
    required this.isLoading,
    required this.textButton,
    required this.sizeFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 50.h,
          decoration: BoxDecoration(
            color: isLoading ? kYellowColor : buttonColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r))
            ),
            onPressed: onClicked,
            child: isLoading
            ? Lottie.asset(
                "assets/animations/loading_horizontal.json",
                height: double.maxFinite.h,
                width: double.maxFinite.w,
              )
            : Text(textButton,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: sizeFont.sp,
                color: kWhiteColor,
              ),
            )
          ),
        ),
        (isLoading) ? Text("mohon tunggu kurang lebih 60 detik...", style: TextStyle(fontSize: 12.sp, color: kRedColor)) : const SizedBox(),
      ],
    );
  }
}