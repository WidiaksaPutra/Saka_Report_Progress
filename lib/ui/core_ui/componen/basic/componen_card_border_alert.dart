// ignore_for_file: must_be_immutable, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class ComponenCardBorderAlert extends StatelessWidget {
  final String textAlert; 
  late bool iconStatus;
  late IconData? icon;
  ComponenCardBorderAlert({super.key,
    this.iconStatus = false,
    this.icon = null,
    required this.textAlert,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          children: [
            if(iconStatus == true)...[
              Expanded(
                child: Row(
                  children: [
                    Text(textAlert,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        color: kPrimaryColor,
                      ),
                    ),
                    Icon(icon, color: kPrimaryColor, size: 20.w,),
                  ],
                ),
              ),
            ]else...[
              Expanded(
                child: Text(textAlert,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ]
          ],
        ),
      )
    );
  }
}