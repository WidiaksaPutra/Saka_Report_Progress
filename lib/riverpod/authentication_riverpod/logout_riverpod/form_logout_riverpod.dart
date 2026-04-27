// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously, prefer_final_fields, strict_top_level_inference, avoid_init_to_null, no_leading_underscores_for_local_identifiers
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/riverpod/authentication_riverpod/logout_riverpod/interface_form_logout_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/util/dialog_basic.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/dialog/componen_content_dialog_image_&_text_.dart';
import 'package:workmanager/workmanager.dart';
import '../../../shared/theme_color.dart';
import '../../../shared/theme_konstanta.dart';

final isLoadingFormLogoutRiverpod = StateProvider.autoDispose<bool>((ref) => false);

final formLogoutRiverpod = StateNotifierProvider.autoDispose<FormLogoutRiverpod, bool>((ref) => FormLogoutRiverpod(ref));

class FormLogoutRiverpod extends StateNotifier<bool> implements InterfaceFormLogoutRiverpod{
  // InterfaceLogout _dataLogout = getItInstance<InterfaceLogout>();
  FormLogoutRiverpod(ref) : super(false);

  @override
  Future<void> logoutData({
    required BuildContext context,
    required bool logoutStatus
  }) async{
    
    await Workmanager().cancelAll();
    // final logoutProses = await _dataLogout.logoutUser(ref: ref);
    // if (logoutProses['status'] == true){
    //   await (await accessTokenBox).clear();
    //   // await loginBox.put("login", false);
    //   await (await tipeKunjunganBox).clear();
    //   state = false;
    //   if(logoutStatus == true){
    //     // BackButtonInterceptor.remove(onBackInterceptor);
    
    // if(_connection == false){
      DialogBasic().voidDialogBasic(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
        borderRadius: BorderRadius.circular(10.r),
        color:kWhiteColor,
        context: context, 
        CloseIconStatus: false,
        barrierDismissible: false,
        autoClose: true,
        navigationAfter: true,
        contentDialog: ComponenContentDialog_ImageAndTitleText(
          image: 'assets/animations/check_lottie.json', 
          text: Text(snackBarLogoutBerhasil, style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor))
          // text: Text((logoutProses['message'] == "") ? snackBarLogoutBerhasil : logoutProses['message'], style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
        ),
      );
      FlutterExitApp.exitApp();
    // }else{
    //   DialogBasic().voidDialogBasic(
    //     padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
    //     borderRadius: BorderRadius.circular(10.r),
    //     color:kWhiteColor,
    //     context: context, 
    //     CloseIconStatus: false,
    //     barrierDismissible: false,
    //     autoClose: true,
    //     navigationAfter: true,
    //     routeNameGo: RouteName.auth,
    //     extra: {'login': true},
    //     contentDialog: ComponenContentDialog_ImageAndTitleText(
    //       image: 'assets/animations/check_lottie.json', 
    //       text: Text(snackBarLogoutBerhasil, style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor))
    //       // text: Text((logoutProses['message'] == "") ? snackBarLogoutBerhasil : logoutProses['message'], style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
    //     ),
    //   );
    // }
    
    //   }
    // } else {
    //   state = false;
    //   if(logoutStatus == true){
    //     DialogBasic().voidDialogBasic(
    //       padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
    //       borderRadius: BorderRadius.circular(10.r),
    //       color:kWhiteColor,
    //       context: context, 
    //       CloseIconStatus: false,
    //       barrierDismissible: false,
    //       autoClose: true,
    //       contentDialog: ComponenContentDialog_ImageAndTitleText(
    //         image: 'assets/animations/close_lottie.json', 
    //         text: Text(snackBarLogoutGagal, style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
    //       ),
    //     );
    //   }
    //   Future.delayed(const Duration(milliseconds: 6000),(){
    //     Navigator.of(context).popUntil((route) => route.isFirst);
    //     FlutterExitApp.exitApp();
    //   });
    // }
  }
}

