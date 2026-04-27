// ignore_for_file: must_be_immutable, use_super_parameters, no_leading_underscores_for_local_identifiers, unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/shared/theme_type_def.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_basic_button.dart';
 
final fileImage = StateProvider.autoDispose<File?>((ref) => null);
final filesImage = StateProvider.autoDispose<List<File>?>((ref) => null);

class ComponenDialogGambarOption extends HookConsumerWidget {
  final voidFunctionNotNull onTapCamera, onTapGalery;
  final int statusImage, jumlahGambar;
  final List listGambar;
  const ComponenDialogGambarOption({Key? key,
    required this.onTapCamera,
    required this.onTapGalery,
    required this.statusImage,
    required this.listGambar,
    required this.jumlahGambar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(listGambar.length < jumlahGambar){
      Navigator.of(context).popUntil((route) => route.isFirst);
    }

    return Column(
      children: [
        Lottie.asset(
          (statusImage == 2)
          ? 'assets/animations/check_lottie.json'
          : (statusImage == 3)
            ? 'assets/animations/loading_big.json'
            : 'assets/animations/loading_horizontal.json',
          height: 150.h,
          width: 152.w,
          alignment: Alignment.center,
        ),
        if(statusImage == 3)...[
          Text("mohon tunggu kurang lebih 60 detik...",style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor), textAlign: TextAlign.center)
        ]else if(statusImage == 2)...[
          Text("sukses menyimpan gambar...",style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor), textAlign: TextAlign.center),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: ComponenBasicButton(
              paddingVertical: 0, 
              borderRadius: 5.r, 
              content: Icon(Icons.check, color: kWhiteColor,),
              onPressed: (){
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              primaryColor: kBlueColor,
              secondaryColor: kGreyColor,
            ),
          ),
        ]else...[
          Text("silakan tentukan sumber gambar yang akan digunakan...?",style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor), textAlign: TextAlign.center),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: ComponenBasicButton(
                    paddingVertical: 0, 
                    borderRadius: 5.r, 
                    content: Icon(Icons.camera_enhance_rounded, color: kWhiteColor,),
                    onPressed: onTapCamera,
                    primaryColor: kGreenColor2,
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
                    content: Icon(Icons.image_rounded, color: kWhiteColor,),
                    onPressed: onTapGalery,
                    primaryColor: kBlueColor,
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
                    content: Icon(Icons.cancel_rounded, color: kWhiteColor,),
                    onPressed: (){
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    primaryColor: kPrimaryColor,
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