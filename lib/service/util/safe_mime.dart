// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:mime/mime.dart';

Future<String?> safeMime(String path) async {
  final file = File(path);

  final bytes = await file.openRead(0, 16).first;

  if (bytes.length >= 2 && bytes[0] == 0xFF && bytes[1] == 0xD8) {
    return "image/jpeg";
  }

  if (bytes.length >= 4 &&
      bytes[0] == 0x89 &&
      bytes[1] == 0x50 &&
      bytes[2] == 0x4E &&
      bytes[3] == 0x47) {
    return "image/png";
  }

  if (bytes.length >= 12 &&
      bytes[8] == 0x57 &&
      bytes[9] == 0x45 &&
      bytes[10] == 0x42 &&
      bytes[11] == 0x50) {
    return "image/webp";
  }

  if (bytes.length >= 12 && String.fromCharCodes(bytes.sublist(4, 8)) == "ftyp") {
    final brand = String.fromCharCodes(bytes.sublist(8, 12));
    const validHeic = {"heic", "heix", "hevc", "hevx", "mif1", "msf1"};
    if (validHeic.contains(brand)) {
      return "image/heic";
    }
  }

 return lookupMimeType(path);
}