// ignore_for_file: prefer_const_constructors, use_super_parameters, must_be_immutable, camel_case_types, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_basic_button.dart';


class ComponenContentDialog_ImageAndTitleTextAnd2ButtonText extends StatelessWidget {
  late String image, textButton1, textButton2;
  late Widget text;
  late VoidCallback onTap1, onTap2;
  late Color buttonColor1, buttonColor2;
  ComponenContentDialog_ImageAndTitleTextAnd2ButtonText({Key? key,
    required this.image,
    required this.text,
    required this.textButton1,
    required this.textButton2,
    required this.buttonColor1,
    required this.buttonColor2,
    required this.onTap1,
    required this.onTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            image,
            height: 150.h,
            width: 152.w,
          ),
          text,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: ComponenBasicButton(
                    paddingVertical: 0, 
                    borderRadius: 5.r, 
                    content: Text(textButton1, style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                    onPressed: onTap1, 
                    primaryColor: buttonColor1,
                    secondaryColor: kGreyColor,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: ComponenBasicButton(
                    paddingVertical: 0, 
                    borderRadius: 5.r, 
                    content: Text(textButton2, style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                    onPressed: onTap2, 
                    primaryColor: buttonColor2,
                    secondaryColor: kGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}