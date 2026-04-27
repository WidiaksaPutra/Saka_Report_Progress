// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sales_progress_report/riverpod/core_control/util/hashing.dart';
import 'package:sales_progress_report/shared/theme_date.dart';

Future<File?> addDateToImage({required ui.Image image, required DateTime? date, required String asalFoto}) async {
  final recorder = ui.PictureRecorder();
  final paintCanvas = Canvas(recorder);
  
  String _hashDateTime = Hashing().shortHashing(
    data: formatDateAll.format(DateTime.now()),
  );

  paintCanvas.drawImage(image, Offset.zero, Paint());
  late String _tKode; 
  if(asalFoto == "Camera"){
    _tKode = "C";
  }else if(asalFoto == "Gallery"){
    _tKode = "G";
  }
  
  final textPainter = TextPainter(
    text: TextSpan(
      text: "Tgl Gambar: ${(date != null && (formatDateAll.format(date) != formatDateAll.format(DateTime.now())))
        ? formatDateAll.format(date) 
        : 'Tanggal Gambar Tidak Tersedia'}\nTgl Saat Ini: ${formatDateAll.format(DateTime.now())}\n$_tKode-$_hashDateTime",
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        backgroundColor: Colors.black54,
      ),
    ),
    textDirection: ui.TextDirection.ltr,
  );

  textPainter.layout();
  textPainter.paint(paintCanvas, Offset(20.w, 20.h));

  final picture = recorder.endRecording();
  final newImage = await picture.toImage(image.width, image.height);
  final byteData = await newImage.toByteData(format: ui.ImageByteFormat.png);
  final pngBytes = byteData!.buffer.asUint8List();

  final tempDir = await getTemporaryDirectory();
  final output = File('${tempDir.path}/$_hashDateTime.png');
  await output.writeAsBytes(pngBytes);

  return output;
}