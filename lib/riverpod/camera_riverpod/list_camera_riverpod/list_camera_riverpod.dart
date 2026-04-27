// // ignore_for_file: unrelated_type_equality_checks, avoid_init_to_null, prefer_final_fields, unused_field

// import 'dart:io';
// import 'package:braya_dev/riverpord/camera_riverpod/list_camera_riverpod/interface_list_camera_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// final listCameraRiverpod = StateNotifierProvider.autoDispose<ListCameraRiverpod, bool>((ref) => ListCameraRiverpod(ref));

// class ListCameraRiverpod extends StateNotifier<bool> implements InterfaceListCameraRiverpod{
//   final ImagePicker imagePicker = ImagePicker();
//   late List<File?> _imageFileList = [];
//   ListCameraRiverpod(ref) : super(false);

//   @override
//   Future<void> selectListImageCamera() async{
//     final XFile? image = await imagePicker.pickImage(source: ImageSource.camera)source: ImageSource.camera, maxWidth: 800, maxHeight: 800);
//     if(image != 'null'){
     
//       File file = File(image!.path);
//       _imageFileList = [..._imageFileList, file];
//     }
//   }

//   @override
//   List<File?> get imageFileList => _imageFileList;
// }