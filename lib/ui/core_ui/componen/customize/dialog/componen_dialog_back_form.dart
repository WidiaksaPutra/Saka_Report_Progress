// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/shared/theme_type_def.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_basic_button.dart';

class ComponenDialogBackForm extends StatelessWidget {
  final int statusBack;
  final String checkText;
  final voidFunctionNotNull onTapConfirm, onTapCancel;
  
  const ComponenDialogBackForm({Key? key,
    required this.statusBack,
    required this.checkText,
    required this.onTapConfirm,
    required this.onTapCancel,
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
              content: Text("Ya", style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
              onPressed: onTapConfirm,
              primaryColor: kPrimaryColor,
              secondaryColor: kGreyColor,
            ),
          ),
        ] else if(statusBack == 3)...[
          Text("mohon tunggu kurang lebih 60 detik...",style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor), textAlign: TextAlign.center)
        ] else...[
          (statusBack == 0)
            ? Text("apakah anda yakin ingin keluar halaman..?",style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor), textAlign: TextAlign.center)
            : Text("masih terdapat data laporan yang belum selesai dikirim, apakah data tersebut akan dihapus atau lanjutkan proses pengiriman laporan...?",style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor), textAlign: TextAlign.center),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: ComponenBasicButton(
                      paddingVertical: 0, 
                      borderRadius: 5.r, 
                      content: Text((statusBack == 0) ? 'Ya' : 'Hapus', style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                      onPressed: onTapConfirm,
                      primaryColor: (statusBack == 0) ? kGreenColor2 : kPrimaryColor,
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
                      content: Text('Tidak', style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                      onPressed: onTapCancel,
                      primaryColor: (statusBack == 0) ? kPrimaryColor : kGreenColor2,
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