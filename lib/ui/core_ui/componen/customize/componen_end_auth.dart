// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class ComponenEndAuth extends StatelessWidget{
  String textAwal, textAkhir;
  VoidCallback onPressed;

  ComponenEndAuth({ Key? key,
    required this.textAwal, 
    required this.textAkhir,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAwal, 
                style: TextStyle(color: kGreyBaseColor, fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: onPressed,
                child: Text(
                  textAkhir,
                  style: TextStyle(color: kPrimaryColor, fontSize: 14.sp, fontWeight: FontWeight.w800), 
                ),
              ),
            ],
          )
        ),
      ],
    );
  }
}