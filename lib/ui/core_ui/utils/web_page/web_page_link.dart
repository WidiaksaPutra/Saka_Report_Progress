// // ignore_for_file: prefer_const_constructors_in_immutables

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sales_progress_report/riverpod/util/riverpod/location_riverpod/url_long_to_coordinate/get_url_long_to_coordinate_riverpod.dart';
// import 'package:sales_progress_report/riverpod/util/util/link_decode_maps_to_addreas.dart';
// import 'package:sales_progress_report/riverpod/util/util/link_decode_url_maps.dart';
// import 'package:sales_progress_report/routes/route_name.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebPageLink extends HookConsumerWidget {
//   final String url;

//   WebPageLink({super.key, required this.url});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final controller = useState<WebViewController?>(null);
//     final _linkUrl = useState<String>(url); // Menyimpan URL yang akan dimuat dalam WebView
//     final isLoading = useState<bool>(true); // State untuk mengontrol loading

//     // Inisialisasi WebViewController ketika pertama kali dibuat
//     // useEffect(() {
//     //   controller.value = WebViewController()
//     //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     //     ..setNavigationDelegate(NavigationDelegate(
//     //       onNavigationRequest: (NavigationRequest request) async {
//     //         // Menangani intent:// URLs (digunakan oleh short link Google Maps)
//     //         if (request.url.startsWith('intent://')) {
//     //           // Ekstrak URL intent untuk dianalisis lebih lanjut
//     //           Uri uri = Uri.parse(request.url);
//     //           //print("test DEBUG: intent URL = ${uri.toString()}");

//     //           // Decode link untuk mendapatkan alamat dan koordinat
//     //           String _decodeLink = linkDecodeUrlMaps(uri.toString());
//     //           //print("test decode link $_decodeLink");

//     //           String _address = linkDecodeMapsToAddreas(_decodeLink);
//     //           //print("test address $_address");

//     //           // Mengambil koordinat dari Riverpod
//     //           await ref.watch(getUrlLongToCoordinateRiverpod.notifier).getUrlLongToCoordinate(urlAddreass: _address);

//     //           Map<String, double> _latLng = ref.watch(getUrlLongToCoordinateRiverpod.notifier).dataCoordinate;
//     //           //print("test latLng $_latLng");

//     //           // Jika koordinat ditemukan, alihkan ke URL peta Google di dalam WebView
//     //           if (_latLng.isNotEmpty) {
//     //             final latitude = _latLng['latitude'];
//     //             final longitude = _latLng['longitude'];
//     //             if (latitude != null && longitude != null) {
//     //               final mapUrl = 'https://www.google.com/maps?q=$latitude,$longitude';
//     //               _linkUrl.value = mapUrl; // Update URL dengan peta berdasarkan koordinat
                  
//     //               // Setelah koordinat ditemukan, kita update status loading dan memuat URL
//     //               isLoading.value = false; // Mengubah status loading setelah peta siap
//     //             }
//     //           }
//     //           return NavigationDecision.prevent; // Mencegah navigasi default
//     //         }

//     //         // Izinkan semua URL lainnya untuk dimuat secara normal
//     //         return NavigationDecision.navigate;
//     //       },
//     //     ));

//     //   return null; // return null untuk tidak melakukan apa-apa saat unmount
//     // }, []); // Hanya sekali inisialisasi saat pertama kali

//     // Jika WebViewController belum siap atau masih loading, tampilkan CircularProgressIndicator
//     // if (controller.value == null || isLoading.value) {
//     //   return const Center(child: CircularProgressIndicator()); // Menunggu loading selesai
//     // }

//     // Setelah koordinat diproses, WebView akan memuat peta langsung
//     return Scaffold(
      // extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 context.go(RouteName.menuPageConnect, extra: {'select': 1});
//               },
//               child: const Icon(Icons.arrow_back_ios_new),
//             ),
//             const Text('Copy Share Link Location'),
//             const SizedBox(),
//           ],
//         ),
//       ),
//       body: WebViewWidget(
//         controller: controller.value!
//           ..loadRequest(Uri.parse(_linkUrl.value)), // Memuat URL peta yang benar
//       ),
//     );
//   }
// }

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/log_riverpod/log_riverpod.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'package:sales_progress_report/shared/theme_konstanta.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageLink extends HookConsumerWidget {
  final String url, error;
  final bool html;

  const WebPageLink({super.key,
    required this.url,
    required this.error,
    required this.html,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useState<WebViewController?>(null)  ;
    final _isLoading = useState<bool>(true);
    
    useEffect((){
      _controller.value = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => _isLoading.value = true,
          onPageFinished: (_) => _isLoading.value = false,
        ),
      );

      if(html == true) {
        _controller.value!.loadHtmlString(
          url,
          baseUrl: "https://mobile-apisakasystem.pt-saa.com/api/sipil/v1"
        );
      } else {
        _controller.value!.loadRequest(Uri.parse(url));
        if(error != "-"){
          () async{
            ref.read(logRiverpod.notifier).logData(
              username: (await usernameBox).get('username')!, 
              module: "sales",
              transactionType: "Error", 
              actionDetails: "post $versiAplikasi $error", 
              status: "0", 
              tableName: "web view",
            );
          }();
        }
      }
      return null;
    }, []);

    return Scaffold(
      extendBodyBehindAppBar: true,      
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.h),
        color: kWhiteColor,
        child: Stack(
          children: [
            WebViewWidget(controller: _controller.value!),
            if (_isLoading.value)
            Align(
              alignment: Alignment.topCenter,
              child: Lottie.asset(
                "assets/animations/loading_big.json",
                height: 200.h,
                width: double.maxFinite
              ),
            ),
          ],
        ),
      ),
    );
  }
}
