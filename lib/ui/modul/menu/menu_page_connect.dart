// ignore_for_file: use_super_parameters, library_private_projects_in_public_api, deprecated_member_use, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, must_be_immutable, unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, await_only_futures, unused_element, unrelated_project_equality_checks, unnecessary_string_interpolations, avoid_print, unused_label, dead_code, sized_box_for_whitespace
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/riverpod/authentication_riverpod/logout_riverpod/form_logout_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/storage/token_local_storage.dart';
import 'package:sales_progress_report/riverpod/core_control/util/dialog_basic.dart';
import 'package:sales_progress_report/riverpod/form_laporan/util/on_tap_report_provider.dart';
import 'package:sales_progress_report/routes/route_name.dart';
import 'package:sales_progress_report/service/webview/informasi_aplikasi/injection_informasi_aplikasi.dart';
import 'package:sales_progress_report/service/webview/informasi_aplikasi/interface_gambar_user.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/shared/theme_konstanta.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/bottom_navigation_item.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_container_card_basic_white.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_content_dialog.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/dialog/componen_content_dialog_image_&_title_text_&_2_button_text.dart';
import 'package:sales_progress_report/ui/core_ui/utils/web_page/web_page_link.dart';
import 'package:sales_progress_report/ui/modul/form_visit/body_form_visit.dart';
import 'package:sales_progress_report/ui/modul/form_visit/form_refresh_dialog.dart';
import '../../../../shared/theme_color.dart';

final _timeProvider = StreamProvider<DateTime>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
});

final listDataStokSna = StateProvider.autoDispose<List>((ref) => []);
final selectedIndex = StateProvider.autoDispose<int>((ref) => 0);
final _navigationSetting = StateProvider.autoDispose<bool>((ref) => false);
final hightFinalCard = StateProvider.autoDispose<double>((ref) => 0.0);
final listTargetKunjunganMenu = StateProvider.autoDispose<List>((ref) => []);
final statusRefreshHome = StateProvider.autoDispose<bool>((ref) => false);

final _screens = StateProvider.autoDispose<List<Widget>>((ref) => [
  SizedBox(),
  BodyFormReport(),
  SizedBox(),
  SizedBox(),
  SizedBox(),
  SizedBox(),
  SizedBox(),
  SizedBox(),
  SizedBox(),
]);

final bottomItems = StateProvider.autoDispose<List<dynamic>>((ref) => [
  BottomNavigationItem("Home", Icons.dashboard),
  BottomNavigationItem("Form Laporan", Icons.work_rounded),
  BottomNavigationItem("Order", Icons.shopping_bag),
  BottomNavigationItem("More", Icons.more_horiz),
  BottomNavigationItem("Stok", Icons.warehouse_rounded),
  BottomNavigationItem("Setting", Icons.more_vert),
  BottomNavigationItem("Location", Icons.location_on_sharp),
  BottomNavigationItem("Data Local", Icons.offline_share_rounded),
  BottomNavigationItem("Connection Parameter", Icons.signal_cellular_alt_rounded),
]);


class MenuPageConnect extends HookConsumerWidget {
  late int select;
  late dynamic refreshKey;
  MenuPageConnect({super.key,
    required this.select,
    required this.refreshKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  InterfaceInformasiAplikasi _dataInterfaceInformasiAplikasi = ref.read(injectionInformasiAplikasi);

  final _isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
  final double _hightPage = MediaQuery.of(context).size.height;

  final _globalLocalStorage = ref.read(globalLocalStorage);
 
  useEffect(() {
    if (select != 0) {
      Future.microtask(() {
        ref.read(selectedIndex.notifier).state = select;
        select = 0;
      });
    }
    return null;
  }, [select]);
 
  final _urlInformasiAplikasi = useState<String>("");
  final _htmlInformasiAplikasi = useState<bool>(false);
  final _errorInformasiAplikasi = useState<String>("-");

  final _linkWebView = useState<String>('https://web.telegram.org');
  final _localGlobal = useState<Map<String, String?>?>(null);
  final _selectedIndex = ref.watch(selectedIndex.select((state) => state));
  useEffect((){
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _localGlobal.value = await _globalLocalStorage.get();
      _linkWebView.value = (_selectedIndex == 0) ? _localGlobal.value!['end_point1'].toString() : _localGlobal.value!['end_point2'].toString();
      print("testing login 5 ${_linkWebView.value}");
    });
    return (){};
  },[_selectedIndex]);

  useEffect((){
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      print("testing link web ${_linkWebView.value} ${_localGlobal.value!['token'].toString()}");
      final _dataInformasiAplikasi = await _dataInterfaceInformasiAplikasi.informasiAplikasi(
        token: _localGlobal.value!['token'].toString(),
        webView: _linkWebView.value,
      );
      _urlInformasiAplikasi.value = _dataInformasiAplikasi['url'].toString();
      _htmlInformasiAplikasi.value = _dataInformasiAplikasi['html'];
      _errorInformasiAplikasi.value = _dataInformasiAplikasi['error'].toString();      
      print("testing link web 3 ${_urlInformasiAplikasi.value} ${_htmlInformasiAplikasi.value}");
    });
    return (){};
  },[_linkWebView.value, _localGlobal.value]);

  Widget _body1Dashboard(){
    return Container(
      height: _hightPage - 200.h,
      child: (_urlInformasiAplikasi.value == "")
      ? Center(
          child: Lottie.asset(
            "assets/animations/loading_big.json",
            height: 150.h,
            width: double.maxFinite,    
          ),
        ) 
      : WebPageLink(
          url: _urlInformasiAplikasi.value, 
          html: _htmlInformasiAplikasi.value,
          error: _errorInformasiAplikasi.value,
        ),
    );
  }

  return Scaffold(
    extendBodyBehindAppBar: true,
    backgroundColor: kWhiteColor,
    resizeToAvoidBottomInset: true,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: _isKeyboardOpen
    ? const SizedBox.shrink()
    : Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: IntrinsicHeight(
            child: ComponenContainerCardBasicWhite(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              borderRadius: BorderRadius.circular(10.r), 
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [  
                  GestureDetector(
                    onTap: () => ref.read(selectedIndex.notifier).state = 0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      curve: Curves.easeIn,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: (ref.watch(selectedIndex) == 0) ? kRedColor2 : kWhiteColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            ref.watch(bottomItems)[0].icon,
                            color: (ref.watch(selectedIndex) == 0) ? kPrimaryColor : kGreyColor,
                            size: (ref.watch(selectedIndex) == 0) ? 26.w : 23.h,
                          ),
                          Text(
                            ref.watch(bottomItems)[0].label,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: (ref.watch(selectedIndex) == 0) ? kPrimaryColor : kGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      ref.read(onTapReportProvider).onTapReport();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      curve: Curves.easeIn,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: (ref.watch(selectedIndex) == 1) ? kRedColor2 : kWhiteColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            ref.watch(bottomItems)[1].icon,
                            color: (ref.watch(selectedIndex) == 1) ? kPrimaryColor : kGreyColor,
                            size: (ref.watch(selectedIndex) == 1) ? 26.w : 23.h,
                          ),
                          Text(
                            ref.watch(bottomItems)[1].label,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: (ref.watch(selectedIndex) == 1) ? kPrimaryColor : kGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){   
                      // Future.microtask(() async{
                      //   await ref.watch(listStokSnaRiverpod.notifier).listStokSna(
                      //     start: "0",
                      //     limit: "10",
                      //     scrollLoading: false,
                      //   );
                      // });
                      ref.read(selectedIndex.notifier).state = 3;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      curve: Curves.easeIn,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: (ref.watch(selectedIndex) == 3) ? kRedColor2 : kWhiteColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            ref.watch(bottomItems)[3].icon,
                            color: (ref.watch(selectedIndex) == 3) ? kPrimaryColor : kGreyColor,
                            size: (ref.watch(selectedIndex) == 3) ? 26.w : 23.h,
                          ),
                          Text(
                            ref.watch(bottomItems)[3].label,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: (ref.watch(selectedIndex) == 3) ? kPrimaryColor : kGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    body: SafeArea(
      maintainBottomViewPadding: true,
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/$base_logo.png",
                            height: 30.h,
                            width: 30.w,
                          ),
                          SizedBox(width: 5.w),
                          Expanded(child: Text("${ref.watch(bottomItems)[ref.watch(selectedIndex)].label}", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w900, color: kGreyColor))),
                        ],
                      ),
                    ),
                    
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if(ref.watch(selectedIndex) == 1)...[
                          GestureDetector(
                            onTap: (){
                              DialogBasic().voidDialogBasic(
                                padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
                                borderRadius: BorderRadius.circular(10.r),
                                color: kWhiteColor,
                                context: context, 
                                CloseIconStatus: false,
                                barrierDismissible: false,
                                autoClose: false,
                                contentDialog: ComponenContentDialog(
                                  widget: FormRefreshDialog(),
                                ),
                              );
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                              curve: Curves.easeIn,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: kGreyColor3,
                              ),
                              child: Icon(
                                Icons.restart_alt,
                                color: kGreyColor,
                                size: 25.h,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                        ],
                        GestureDetector(
                          onTap: () async{
                            DialogBasic().voidDialogBasic(
                              padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
                              borderRadius: BorderRadius.circular(10.r),
                              color: kWhiteColor,
                              context: context, 
                              CloseIconStatus: false,
                              barrierDismissible: false,
                              autoClose: false,
                              contentDialog: ComponenContentDialog_ImageAndTitleTextAnd2ButtonText(
                                image: 'assets/animations/peringatan_lottie.json', 
                                text: Text("apakah anda yakin ingin logout..?",
                                style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
                                textButton1: 'Ya', 
                                textButton2: 'Tidak', 
                                buttonColor1: kGreenColor, 
                                buttonColor2: kPrimaryColor, 
                                onTap1: () async{
                                  await ref.watch(formLogoutRiverpod.notifier).logoutData(context: context, logoutStatus: true);
                                },
                                onTap2: () async{
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min, // Agar Row hanya sebesar kebutuhan
                            children: [
                              Icon(
                                Icons.logout,
                                color: kPrimaryColor,
                                size: 25.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]
                ),
              ),
              Container(
                color: kPrimaryColor,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                height: 1.h,
              ),
              Expanded(
                child: WillPopScope(
                  onWillPop: () async{
                    return false;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if(ref.watch(selectedIndex) == 0 || ref.watch(selectedIndex) == 3)...[
                          _body1Dashboard()
                        ],
                        ref.watch(_screens)[ref.watch(selectedIndex)],
                      ],
                    )
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}