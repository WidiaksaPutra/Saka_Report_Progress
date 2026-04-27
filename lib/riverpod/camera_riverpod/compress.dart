import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<File?> compressToTarget(File file) async {
  const targetSize = 250 * 1024; // 250 KB

  int quality = 90;
  File result = file;

  do {
    final compressedBytes = await FlutterImageCompress.compressWithFile(
      result.path,
      quality: quality,
      format: CompressFormat.jpeg,
    );

    if (compressedBytes == null) return result;

    final tempFile = File('${result.path}_$quality.jpg');
    await tempFile.writeAsBytes(compressedBytes);

    final size = await tempFile.length();

    // print("Compress quality $quality → ${(size / 1024).toStringAsFixed(2)} KB");

    result = tempFile;

    if (size <= targetSize) {
      return result;
    }

    quality -= 10;
  } while (quality > 10);

  return result;
}