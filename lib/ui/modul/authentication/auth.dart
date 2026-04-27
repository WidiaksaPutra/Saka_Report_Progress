// ignore_for_file: use_super_parameters, no_leading_underscores_for_local_identifiers, unrelated_type_equality_checks, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_konstanta.dart';
import '../../../shared/theme_color.dart';
import 'login_form.dart';

class Auth extends ConsumerWidget {
  final bool login; 
  const Auth({Key? key, required this.login}) : super(key: key);

  Widget titleAuth(WidgetRef ref){
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 15.h,
                bottom: 30.h,
                left: 20.w,
                right: 20.w,
              ),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/$base_logo.png",
                    height: 100.h,
                    width: 150.w,
                  ),
                  SizedBox(height: 20.h,),
                  const Text("Silahkan login sesuai akun SIIS anda", textAlign: TextAlign.center, style: TextStyle(color: kBlackColor),),
                  SizedBox(height: 40.h,),
                  LoginForm(ref: ref,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kWhiteColor,
      body: titleAuth(ref),
    );
  }
}