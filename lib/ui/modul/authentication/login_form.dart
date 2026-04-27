// ignore_for_file: unused_element, no_leading_underscores_for_local_identifiers, prefer_is_empty, use_build_context_synchronously, unnecessary_string_interpolations, use_super_parameters, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/connection_basic/connection_basic.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/connection_basic/connection_basic_state.dart';
import 'package:sales_progress_report/riverpod/core_control/util/dialog_basic.dart';
import 'package:sales_progress_report/routes/route_name.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/error_form.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/card_button.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/componen_form_suffix_prefix_icon.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/dialog/componen_content_dialog_image_&_text_.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/dialog/componen_content_dialog_image_&_title_text_&_button_text.dart';
import '../../../riverpod/authentication_riverpod/login_riverpod/form_login_riverpod.dart';
import '../../../shared/theme_color.dart';
import '../../../shared/theme_konstanta.dart';

final isFilterStatusConnection = StateProvider.autoDispose<bool>((ref) => true);

final _usernameErrorRiverpod = StateProvider.autoDispose<bool>((ref) => false);
final _passwordErrorRiverpod = StateProvider.autoDispose<bool>((ref) => false);
final _passwordVisibleRiverpod = StateProvider.autoDispose<bool>((ref) => true);

final usernameProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');

final usernameControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController(text: ref.read(usernameProvider));
  controller.addListener(() {
    ref.read(usernameProvider.notifier).state = controller.text;
  });

  return controller;
});

final passwordControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController(text: ref.read(passwordProvider));
  controller.addListener(() {
    ref.read(passwordProvider.notifier).state = controller.text;
  });

  return controller;
});

final _formKey = GlobalKey<FormState>();

class LoginForm extends HookWidget {
  final WidgetRef ref;
  const LoginForm({Key? key, required this.ref}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = ref.watch(usernameControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    final _loadingLogin = useState<bool>(false);
    
    final bool _isFilterStatusConnection = ref.watch(isFilterStatusConnection.select((state) => state));

    final _connectionDevice = useState<bool>(false);
    final _latencyDevice = useState<int>(1000);
    final _loadingDevice = useState<bool>(true);
    final _username = useState<Box<String>?>(null);
    final _password = useState<Box<String>?>(null);
    
    useEffect((){
      () async{
        _username.value = (await usernameBox);
        _password.value = (await passwordBox);
      }();
      return null;
    },[]);
    
    useEffect(() {
      final _sub = ref.listenManual<ConnectionBasicState>(
        connectionBasicRiverpod,
        (prev, next) {
          _loadingDevice.value = next.loading;
          if(_loadingDevice.value == false){
            _connectionDevice.value = next.connection;
            _latencyDevice.value = next.latency;
          }
        },
      );
      return () => _sub.close();
    }, []);

    Future(() async{
      if(usernameController.text == "" && _username.value?.get('username') != null){
        usernameController.text = _username.value!.get('username')!;
      }
      if(passwordController.text == "" && (await passwordBox).get('password') != null){
        passwordController.text = (await passwordBox).get('password')!;
      }
    });

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text("Username"),           
          SizedBox(height: 10.h),
          Consumer(builder: (context, ref, child) {
            return ComponenFormSuffixPrefixIcon(
              controller: usernameController,
              keyboardType: TextInputType.text,
              hintText: "Username", 
              icon: Icons.person,
              onChanged: (value) {
                if (value.isEmpty) {
                  ref.read(_usernameErrorRiverpod.notifier).state = true;
                }else{
                  ref.read(_usernameErrorRiverpod.notifier).state = false;
                }
                return null;
              }, 
              validator: (value) {
                if (value!.isEmpty) {
                  ref.read(_usernameErrorRiverpod.notifier).state = true;
                }
                return null;
              },
              maxLines: 1,
              colorIcon: kPrimaryColor,
            );
          },),
          Consumer(
            builder: (BuildContext context, WidgetRef ref,_) {
              final _usernameError = ref.watch(_usernameErrorRiverpod);
              return Visibility(
                visible: _usernameError,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 5.h),
                    FormErrors(errors: kUsernameNullError, fontSize: 12.sp, color: kRedColor),
                  ],
                )
              );
            },
          ),
          SizedBox(height: 20.h),
          Text("Password"),           
          SizedBox(height: 10.h),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, _) {
              final _passwordVisible = ref.watch(_passwordVisibleRiverpod);
              return ComponenFormSuffixPrefixIcon(
                controller: passwordController, 
                keyboardType: TextInputType.text,
                hintText: "Password", 
                icon: Icons.lock,
                obscureText: _passwordVisible,
                onChanged: (value) {
                  if (value.isEmpty) {
                    ref.read(_passwordErrorRiverpod.notifier).state = true;
                  }else{
                    ref.read(_passwordErrorRiverpod.notifier).state = false;
                  }
                  return null; 
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    ref.read(_passwordErrorRiverpod.notifier).state = true;
                  }
                  return null;
                },
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: IconButton(
                    onPressed: (){
                      ref.read(_passwordVisibleRiverpod.notifier).state =! _passwordVisible;
                    },
                    icon: Icon(
                      (_passwordVisible) ? Icons.visibility_off : Icons.visibility,
                      size: 20.w,
                      color: (_passwordVisible) ? kGreyBaseColor : kPrimaryColor,
                    ),
                  ),
                ),
                maxLines: 1,
                colorIcon: kPrimaryColor,
              );
            },
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref,_) {
              final _passwordError = ref.watch(_passwordErrorRiverpod);
              return Visibility(
                visible: _passwordError,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 5.h),
                    FormErrors(errors: kPassNullError, fontSize: 12.sp, color: kRedColor),
                    SizedBox(height: 8.h),
                  ],
                )
              );
            }, 
          ),
          SizedBox(height: 20.h),
          Consumer(
            builder: (BuildContext context, WidgetRef ref,_){
              final _formLogin = ref.watch(formLoginRiverpod.notifier);
              return CardButton(
                sizeFont: 20,
                isLoading: _loadingLogin.value,
                onClicked: () async{
                  Future.delayed(Duration(seconds: 8),(){
                    if(_connectionDevice.value == false && _loadingLogin.value == true){
                      DialogBasic().voidDialogBasic(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
                        borderRadius: BorderRadius.circular(10.r),
                        color: kWhiteColor,
                        context: context,
                        CloseIconStatus: false,
                        barrierDismissible: false,
                        autoClose: false,
                        contentDialog: ComponenContentDialog_ImageAndTitleTextAndButtonText(
                          image: 'assets/animations/loading_big.json',
                          text: Text("koneksi anda tidak stabil...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
                          textButton: 'Ok',
                          onTap: () {
                            Navigator.of(context).pop();
                            _loadingLogin.value = false;
                          },
                        ),
                      );
                    }
                  });
                  
                  if(_loadingLogin.value == true){
                    DialogBasic().voidDialogBasic(
                      padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
                      borderRadius: BorderRadius.circular(10.r),
                      color: kWhiteColor,
                      context: context,
                      CloseIconStatus: false,
                      barrierDismissible: false,
                      autoClose: false,
                      contentDialog: ComponenContentDialog_ImageAndTitleTextAndButtonText(
                        image: 'assets/animations/loading_big.json',
                        text: Text("mohon tunggu kurang lebih 60 detik...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
                        textButton: 'Close',
                        onTap: () {
                          Navigator.of(context).pop();
                          _loadingLogin.value = false;
                        },
                      ),
                    );
                    Future.delayed(Duration(seconds: 10),(){
                      DialogBasic().voidDialogBasic(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
                        borderRadius: BorderRadius.circular(10.r),
                        color:kWhiteColor,
                        context: context, 
                        CloseIconStatus: false,
                        barrierDismissible: false,
                        autoClose: true,
                        contentDialog: ComponenContentDialog_ImageAndTitleText(
                          image: 'assets/animations/peringatan_lottie.json', 
                          text: Text("maaf, proses login terlalu lama, tolong mengulangi login kembali...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
                        ),
                      );
                      _loadingLogin.value = false;
                      Future.delayed(const Duration(milliseconds: 6000),(){
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        FlutterExitApp.exitApp();
                      });
                    });
                  }
                  if(_loadingLogin.value == false){
                    _loadingLogin.value = true;
                    if (_formKey.currentState!.validate()) {
                      await _formLogin.loginData(
                        username: usernameController.text,
                        password: passwordController.text,
                        connection: _isFilterStatusConnection,
                      );
                      late int _statusDialog = ref.watch(formLoginRiverpod.select((state) => state.statusDialog));
                      late String _messageDialog = ref.watch(formLoginRiverpod.select((state) => state.message));
                      await Future.delayed(Duration(milliseconds: 1000),(){
                        FocusScope.of(context).unfocus();
                        if(_statusDialog == 1){
                          DialogBasic().voidDialogBasic(
                            padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
                            borderRadius: BorderRadius.circular(10.r),
                            color: kWhiteColor,
                            context: context, 
                            CloseIconStatus: false,
                            barrierDismissible: false,
                            autoClose: true,
                            navigationAfter: true,
                            routeNameGo: RouteName.menuPageConnect,
                            extra: {
                              'select': 0,
                              'refresh': DateTime.now().millisecondsSinceEpoch,
                            },
                            contentDialog: ComponenContentDialog_ImageAndTitleText(
                              image: 'assets/animations/check_lottie.json', 
                              text: Text(snackBarLoginBerhasil, style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)), 
                            ),
                          );
                        }else{
                          DialogBasic().voidDialogBasic(
                            padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
                            borderRadius: BorderRadius.circular(10.r),
                            color: kWhiteColor,
                            context: context, 
                            CloseIconStatus: false,
                            barrierDismissible: false,
                            autoClose: false,
                            contentDialog: ComponenContentDialog_ImageAndTitleTextAndButtonText(
                              primaryColor: kRedColor,
                              image: 'assets/animations/peringatan_lottie.json', 
                              text: Text(_messageDialog,
                              style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
                              textButton: 'Ok',
                              onTap: (){
                                _loadingLogin.value = false;
                                Navigator.of(context).pop();
                              } 
                            ),
                          );
                        }
                      });
                    }else{
                      DialogBasic().voidDialogBasic(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
                        borderRadius: BorderRadius.circular(10.r),
                        color: kWhiteColor,
                        context: context, 
                        CloseIconStatus: false,
                        barrierDismissible: false,
                        autoClose: true,
                        contentDialog: ComponenContentDialog_ImageAndTitleText(
                          image: 'assets/animations/peringatan_lottie.json', 
                          text: Text("maaf, proses login harus online dengan baik...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
                        ),
                      );
                      _loadingLogin.value = false;
                      Future.delayed(Duration(milliseconds: 6000),(){
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        FlutterExitApp.exitApp();
                      });
                    }
                  }
                }, 
                textButton: 'Login',
              );
            }
          ),
          SizedBox(height:10.h),
          Center(child: Text("$versiAplikasi", textAlign: TextAlign.center, style: TextStyle(color: kGreyBaseColor, fontWeight: FontWeight.w600, fontSize: 10.sp))),
        ],
      ),
    );
  }
}