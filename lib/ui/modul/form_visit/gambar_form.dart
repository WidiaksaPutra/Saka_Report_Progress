// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_konstanta.dart';
import 'package:sales_progress_report/shared/theme_type_def.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/error_form.dart';

class GambarForm extends StatelessWidget {
  final String title;
  final int jumlahGambar;
  final valueListenable listGambarPath;
  final voidFunction onTapTambah;
  final Widget widgetHapusGambar;
  final bool gambarError;
  const GambarForm({super.key,
    required this.title,
    required this.jumlahGambar,
    required this.listGambarPath,
    required this.onTapTambah,
    required this.widgetHapusGambar,
    required this.gambarError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500)),
        Row(
          children: [
            if(listGambarPath.value.length < jumlahGambar)...[
              GestureDetector(
                onTap: onTapTambah,
                child: Container(
                  margin: EdgeInsets.only(top: 5.h),
                  padding: EdgeInsets.symmetric(
                    vertical: 40.0.h,
                    horizontal: 40.0.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(
                      color: kGreyColor,
                    )
                  ),
                  child: const Icon(Icons.add, color: kPrimaryColor,),
                ),
              ),
            ],
            if(listGambarPath.value.isNotEmpty)...[
              Flexible(
                child: SizedBox(
                  height: 113.h,
                  child: widgetHapusGambar,
                ),
              ),
            ],
          ],
        ),
        Visibility(
          visible: gambarError,
          child: Column(
            children: <Widget>[
              SizedBox(height: 5.h),
              FormErrors(errors: kGambarNullError, fontSize: 12.sp, color: kRedColor),
            ],
          )
        ),
      ],
    );
  }
}