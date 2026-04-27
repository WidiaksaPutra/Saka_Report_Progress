// // ignore_for_file: unrelated_type_equality_checks, avoid_init_to_null, unused_field, prefer_final_fields, no_leading_underscores_for_local_identifiers

// import 'dart:io';
// import 'package:braya_dev/riverpord/camera_riverpod/camera_face_recognition.dart/interface_face_recognition_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// import 'package:image_picker/image_picker.dart';

// final singleFaceRecognition = StateNotifierProvider.autoDispose<SingleFaceRecognitionRiverpod, bool>((ref) => SingleFaceRecognitionRiverpod(ref));

// class SingleFaceRecognitionRiverpod extends StateNotifier<bool> implements InterfaceFaceRecognitionRiverpod{
//   final ImagePicker _imagePicker = ImagePicker();
//   late File? _imageFile = null;
//   late List<Face>? _faces = null;
//   SingleFaceRecognitionRiverpod(ref) : super(false);

//   @override
//   Future<void> selectFaceRecognition() async{
//     final _image = await _imagePicker.pickImage(source: ImageSource.camera)source: ImageSource.camera, maxWidth: 800, maxHeight: 800);
//     if(_image != 'null'){
//       File file = File(_image!.path);
//       _imageFile = file;
//       await processImage();
//     }
//   }

//   @override
//   Future<void> processImage() async{
//     final FaceDetector _faceDetector = FaceDetector(
//       options: FaceDetectorOptions(
//         enableContours: true,
//         enableClassification: true,
//       ),
//     );
//     if(_imageFile != null){
//       final _inputImage = InputImage.fromFile(_imageFile!);
//       final _face = await _faceDetector.processImage(_inputImage);
//       _faces = _face;
//       //print("test faces ${_faces![0].boundingBox}");
//     }
//   }

//   @override
//   File? get imageFile => _imageFile;

//   @override
//   List<Face>? get faces => _faces;
// }