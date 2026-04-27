// ignore_for_file: prefer_const_constructors, use_super_parameters, must_be_immutable, camel_case_types, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_basic_button.dart';


class ComponenContentDialog_ImageAndTitleTextAndButtonText extends StatelessWidget {
  late String image, textButton;
  late Widget text;
  late VoidCallback onTap;
  late Color primaryColor;
  
  ComponenContentDialog_ImageAndTitleTextAndButtonText({Key? key,
    this.primaryColor = kPrimaryColor,
    required this.image,
    required this.text,
    required this.textButton,
    required this.onTap,
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: ComponenBasicButton(
              paddingVertical: 0, 
              borderRadius: 5.r, 
              content: Text(textButton, style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16)),
              onPressed: onTap, 
              primaryColor: primaryColor,
              secondaryColor: kGreyColor,
            ),
          )
        ],
      ),
    );
  }
}