// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, prefer_const_constructors, avoid_print, unnecessary_brace_in_string_interps

import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/connection_basic/connection_basic_state.dart';

final connectionBasicRiverpod = StateNotifierProvider.autoDispose<ConnectionBasicRiverpod, ConnectionBasicState>((ref) => ConnectionBasicRiverpod(ref));
class ConnectionBasicRiverpod extends StateNotifier<ConnectionBasicState>{
  final Ref _ref;
  Timer? _timer;
  ConnectionBasicRiverpod(this._ref) : super(ConnectionBasicState(loading: true)) {
    connectionBasic(); // jalankan pertama kali
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      connectionBasic();
    });

    _ref.onDispose(() {
      _timer?.cancel(); // mencegah memory leak
    });
  }

  connectionBasic() async{
    try {
      final _stopwatch = Stopwatch()..start();
      final _result = await Socket.connect("mobile-apisakasystem.pt-saa.com", 443).timeout(Duration(seconds: 3));
      _stopwatch.stop();
      _result.destroy();
      
      final int _latency = _stopwatch.elapsedMilliseconds;
      
      if(_latency >= 0 && _latency <= 150){
        state = state.connectionBasicState(
          loading: false,
          connection: true,
          latency: _latency,
          statusConnection: "baik", 
        );
      }else if(_latency >= 150 && _latency <= 250){
        state = state.connectionBasicState(
          loading: false,
          connection: true,
          latency: _latency,
          statusConnection: "cukup", 
        );
      }else if(_latency > 250 && _latency < 1000){
        state = state.connectionBasicState(
          loading: false,
          connection: true,
          latency: _latency,
          statusConnection: "lambat", 
        );
      }else if(_latency >= 1000){
        state = state.connectionBasicState(loading: false);
      }
    } on SocketException catch (_) {
      state = state.connectionBasicState(loading: false);
    }
  }
}

  // late double _download = 0.0;
  // late double _upload = 0.0;

// _download = await _connectionDownloadSpeed("https://mobile-apisakasystem.pt-saa.com");
      
      // _upload = await _connectionUploadSpeed("https://mobile-apisakasystem.pt-saa.com/api/sales/v1/login");

// _connectionDownloadSpeed(String url) async {
  //   final stopwatch = Stopwatch()..start();
  //   final request = await HttpClient().getUrl(Uri.parse(url));
  //   final response = await request.close();

  //   int bytes = 0;
  //   await for (var chunk in response) {
  //     bytes += chunk.length;
  //   }

  //   stopwatch.stop();
  //   final seconds = stopwatch.elapsedMilliseconds / 1000;
    
  //   print("testing download ${(bytes * 8) / (seconds * 1000000)}");
  //   return (bytes * 8) / (seconds * 1000000);
  // }
  
  // _connectionUploadSpeed(String url) async {
  //   final dummyData = List<int>.filled(2 * 1024 * 1024, 0); // 2MB
  //   final stopwatch = Stopwatch()..start();

  //   final request = await HttpClient().postUrl(Uri.parse(url));
  //   request.add(dummyData);
  //   final response = await request.close();
  //   await response.drain();

  //   stopwatch.stop();
  //   final seconds = stopwatch.elapsedMilliseconds / 1000;

  //   print("testing upload ${(dummyData.length * 8) / (seconds * 1000000)}");
  //   return (dummyData.length * 8) / (seconds * 1000000);
  // }

// if(latency >= 0 && latency <= 150){
//         return latency;
//       }else if(latency >= 150 && latency <= 200){
//         // await UtilSnackBar().snackBar(
//         //   context: context,
//         //   margin: EdgeInsets.only(bottom: 100.0.h, left: 10.0.w, right: 10.0.w),
//         //   textSnackBar: "latency: $latency, kecepatan akses server lambat, disarankan untuk mencari konseksi internet yang lebih baik, dan stop proses upload dan download pada aplikasi lain...",
//         //   backgroudColor:Color.fromARGB(255, 255, 248, 189),
//         //   textColor: kGreyColor,
//         // );
//         return latency;
//       }else if(latency > 200 && latency < 500){
//         // await UtilSnackBar().snackBar(
//         //   context: context,
//         //   margin: EdgeInsets.only(bottom: 100.0.h, left: 10.0.w, right: 10.0.w),
//         //   textSnackBar: "latency: $latency, kecepatan akses server buruk, disarankan untuk mencari koneksi internet yang lebih baik. jika masih belum teratasi disarankan untuk mematikan paket data dan akses aplikasi dalam mode offline..",
//         //   backgroudColor:Color.fromARGB(255, 255, 248, 189),
//         //   textColor: kGreyColor,
//         // );
//       }else if(latency > 500){
//         // await UtilSnackBar().snackBar(
//         //   context: context,
//         //   margin: EdgeInsets.only(bottom: 100.0.h, left: 10.0.w, right: 10.0.w),
//         //   textSnackBar: "latency: $latency, dengan kecepatan akses server yang sangat buruk. disarankan untuk mematikan paket data dan akses aplikasi dalam mode offline..",
//         //   backgroudColor:Color.fromARGB(255, 255, 248, 189),
//         //   textColor: kGreyColor,
//         // );
//       }

// if(showDialog == true && (await modeOnlineBox).get('mode_online') == true){
//           DialogBasic().voidDialogBasic(
//             padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
//             borderRadius: BorderRadius.circular(10.r),
//             color:kWhiteColor,
//             context: context, 
//             CloseIconStatus: false,
//             barrierDismissible: false,
//             autoClose: false,
//             contentDialog: ComponenContentDialog_ImageAndTitleTextAndButtonText(
//               primaryColor: kPrimaryColor,
//               image: 'assets/animations/peringatan_lottie.json', 
//               text: Text('koneksi akses server buruk, silahkan aktifkan mode offline...', style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
//               textButton: 'Ok',
//               onTap: (){
//                 Navigator.of(context).pop();
//               }
//             )
//           );
//         }

// if(showDialog == true && (await modeOnlineBox).get('mode_online') == true){
        //   DialogBasic().voidDialogBasic(
        //     padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
        //     borderRadius: BorderRadius.circular(10.r),
        //     color:kWhiteColor,
        //     context: context, 
        //     CloseIconStatus: false,
        //     barrierDismissible: false,
        //     autoClose: false,
        //     contentDialog: ComponenContentDialog_ImageAndTitleTextAndButtonText(
        //       primaryColor: kPrimaryColor,
        //       image: 'assets/animations/peringatan_lottie.json', 
        //       text: Text('koneksi akses server buruk, silahkan aktifkan mode offline...', style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
        //       textButton: 'Ok',
        //       onTap: (){
        //         Navigator.of(context).pop();
        //       }
        //     )
        //   );
        // }