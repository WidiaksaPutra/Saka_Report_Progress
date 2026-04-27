
import 'dart:io';
import 'package:exif/exif.dart';

Future<DateTime?> getImageDateFromFile(String path) async {
  final bytes = await File(path).readAsBytes();
  final data = await readExifFromBytes(bytes);

  final dateStr = data['EXIF DateTimeOriginal']?.printable;

  if (dateStr == null) return null;

  // format: "2024:03:15 10:30:45"
  final formatted = dateStr.replaceFirstMapped(
    RegExp(r'^(\d{4}):(\d{2}):(\d{2})'),
    (m) => "${m[1]}-${m[2]}-${m[3]}",
  );

  return DateTime.parse(formatted);
}