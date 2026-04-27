// ignore_for_file: must_be_immutable, use_super_parameters, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/shared/theme_type_def.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_basic_button.dart';

class ComponenDialogForm extends StatelessWidget {
  final int statusBack;
  final String checkText, reportText, textYes, textNo;
  final Color primaryColorYes, primaryColorNo;
  final voidFunctionNotNull onTapConfirm, onTapCancel;
  
  const ComponenDialogForm({Key? key,
    required this.statusBack,
    required this.checkText,
    required this.onTapConfirm,
    required this.onTapCancel,
    required this.reportText,
    required this.textYes,
    required this.textNo,
    required this.primaryColorYes,
    required this.primaryColorNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          (statusBack == 2)
          ? 'assets/animations/check_lottie.json'
          : (statusBack == 3)
            ? 'assets/animations/loading_big.json'
            : 'assets/animations/loading_horizontal.json',
          height: 150.h,
          width: 152.w,
          alignment: Alignment.center,
        ),
        if(statusBack == 2)...[
          Text(checkText, style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor), textAlign: TextAlign.center,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: ComponenBasicButton(
              paddingVertical: 0, 
              borderRadius: 5.r, 
              content: Text(textYes, style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
              onPressed: onTapConfirm,
              primaryColor: kPrimaryColor,
              secondaryColor: kGreyColor,
            ),
          ),
        ] else if(statusBack == 3)...[
          Text("mohon tunggu kurang lebih 60 detik...",style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor), textAlign: TextAlign.center)
        ] else...[
            Text("$reportText",style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor), textAlign: TextAlign.center),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: ComponenBasicButton(
                      paddingVertical: 0, 
                      borderRadius: 5.r, 
                      content: Text(textYes, style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                      onPressed: onTapConfirm,
                      primaryColor: primaryColorYes,
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
                      content: Text(textNo, style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                      onPressed: onTapCancel,
                      primaryColor: primaryColorNo,
                      secondaryColor: kGreyColor,
                    ),
                  ),
                ),
              ],
            )
        ],
      ],
    );
  }
}