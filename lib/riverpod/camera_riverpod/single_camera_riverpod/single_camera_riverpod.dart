// ignore_for_file: unrelated_type_equality_checks, avoid_init_to_null, unused_field, prefer_final_fields, no_leading_underscores_for_local_identifiers, await_only_futures, unused_local_variable, avoid_print, strict_top_level_inference

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sales_progress_report/riverpod/camera_riverpod/compress.dart';
import 'package:sales_progress_report/riverpod/core_control/util/image/add_date_to_image.dart';
import 'package:sales_progress_report/riverpod/core_control/util/image/get_image_date_from_file.dart';
import 'interface_single_camera_riverpod.dart';
import 'dart:ui' as ui;

final singleCameraRiverpod = StateNotifierProvider.autoDispose<SingleCameraRiverpod, bool>((ref) => SingleCameraRiverpod(ref));

class SingleCameraRiverpod extends StateNotifier<bool> implements InterfaceSingleCameraRiverpod {
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;

  SingleCameraRiverpod(ref) : super(false);

  @override
  Future<File?> pickImageCamera() async {
    try {
      final _deviceInfo = DeviceInfoPlugin();
      final _versionAndroid = (await _deviceInfo.androidInfo).version.sdkInt;

      final cam = await Permission.camera.request();
      if (!cam.isGranted) return null;
      
      if (Platform.isAndroid && _versionAndroid <= 32) {
        final st = await Permission.storage.request();
        if (!st.isGranted) return null;
      }else if (Platform.isAndroid && _versionAndroid >= 33) {
        final st = await Permission.photos.request();
        if (!st.isGranted) return null;
      }

      final image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1280,
        imageQuality: 60,
      );

      if (image == null) return null;

      final exifDate = await getImageDateFromFile(image.path);
      final finalDate = exifDate;

      final bytes = await image.readAsBytes();
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();

      File? file = await addDateToImage(
        image: frame.image,
        date: finalDate,
        asalFoto: "Camera",
      );
      if (file == null) return null;

      file = await compressToTarget(file);

      return file;
    } catch (e) {
      debugPrint("Image pick error: $e");
      return null;
    }
  }

  Future<List<File>?> pickImageGallery() async{
    try {
      final _deviceInfo = DeviceInfoPlugin();
      final _versionAndroid = (await _deviceInfo.androidInfo).version.sdkInt;

      if (Platform.isAndroid && _versionAndroid <= 32) {
        final st = await Permission.storage.request();
        if (!st.isGranted) return null;
      }else if (Platform.isAndroid && _versionAndroid >= 33) {
        final st = await Permission.photos.request();
        if (!st.isGranted) return null;
      }

      final images = await _imagePicker.pickMultiImage(
        maxWidth: 1024,
        maxHeight: 1280,
        imageQuality: 60,
      );

      if (images.isEmpty) return null;

      List<File> results = [];

      for (var image in images) {
        final exifDate = await getImageDateFromFile(image.path);
        final finalDate = exifDate ?? DateTime.now();

        final bytes = await image.readAsBytes();
        final codec = await ui.instantiateImageCodec(bytes);
        final frame = await codec.getNextFrame();

        File? file = await addDateToImage(
          image: frame.image,
          date: finalDate,
          asalFoto: 'Gallery',
        );
        if (file == null) continue;

        file = await compressToTarget(file);
        results.add(file!);
      }

      return results;
    } catch (e) {
      debugPrint("Image pick error: $e");
      return null;
    }
  }
}