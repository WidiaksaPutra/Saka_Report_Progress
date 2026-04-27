// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers, prefer_const_constructors, use_super_parameters, await_only_futures, unrelated_type_equality_checks, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/connection_basic/connection_basic.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/connection_basic/connection_basic_state.dart';
import 'package:sales_progress_report/riverpod/core_control/util/dialog_basic.dart';
import 'package:sales_progress_report/routes/route_name.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'package:sales_progress_report/shared/theme_konstanta.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/dialog/componen_content_dialog_image_&_text_.dart';
import '../../shared/theme_color.dart';
class SplashScreen extends HookConsumerWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect((){
      Future.microtask(() async{
        if((await usernameBox).get('username') != null){  
          context.go(RouteName.auth, extra: {'login': true});
        }else{
          ref.listenManual<ConnectionBasicState>(
            connectionBasicRiverpod,
            (prev, next) {
              Future(() async{
                if(next.connection == true){
                  context.go(RouteName.auth, extra: {'login': true});
                }else{
                  DialogBasic().voidDialogBasic(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
                    borderRadius: BorderRadius.circular(10.r),
                    color:kWhiteColor,
                    context: context, 
                    CloseIconStatus: false,
                    barrierDismissible: false,
                    autoClose: true,
                    navigationAfter: true,
                    routeNameGo: RouteName.auth,
                    extra: {'login': true},
                    contentDialog: ComponenContentDialog_ImageAndTitleText(
                      image: 'assets/animations/peringatan_lottie.json', 
                      text: Text('maaf tidak terdapat akses internet, aplikasi dalam keadaan offline...', style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
                    ),
                  );
                  context.go(RouteName.auth, extra: {'login': true});
                }
              });
            },
          );
        }
      });
      return null;
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Image.asset(
                  "assets/images/$base_logo.png",
                  height: 100.0.h,
                  width: 100.0.w,
                ),
                Text("Sales",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: kYellowColor,
                  ),
                ),
                Lottie.asset(
                  "assets/animations/loading_big.json",
                  height: 100.h,
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}