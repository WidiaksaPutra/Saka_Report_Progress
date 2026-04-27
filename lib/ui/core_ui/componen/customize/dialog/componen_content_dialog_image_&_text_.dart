// ignore_for_file: use_super_parameters, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ComponenContentDialog_ImageAndTitleText extends StatelessWidget {
  late String image;
  final Widget text;
  late bool imageStatus;
  ComponenContentDialog_ImageAndTitleText({Key? key,
    this.imageStatus = true,
    this.image = "assets/animations/peringatan_lottie.json",
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: (imageStatus == true)
      ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              image,
              height: 150.h,
              width: 152.w,
            ),
            text
          ],
        )
      : text,
    );
  }
}