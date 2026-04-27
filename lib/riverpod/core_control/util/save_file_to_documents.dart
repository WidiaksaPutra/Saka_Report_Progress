// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Future<String> saveFileToDocuments(File sourceFile) async {
  final dir = await getApplicationDocumentsDirectory();

  final fileName = path.basename(sourceFile.path);
  String savedPath = path.join(dir.path, fileName);
  File destFile = File(savedPath);

  if (await destFile.exists()) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    final name = path.basenameWithoutExtension(fileName);
    final ext = path.extension(fileName);

    savedPath = path.join(dir.path, '${name}_$timestamp$ext');
    destFile = File(savedPath);
  }

  await sourceFile.copy(savedPath);
  return savedPath;
}

Future<List<String>> saveFilesToDocuments(List<File> files) async {
  final dir = await getApplicationDocumentsDirectory();

  final results = await Future.wait(
    files.map((sourceFile) async {
      final fileName = path.basename(sourceFile.path);
      String savedPath = path.join(dir.path, fileName);
      File destFile = File(savedPath);

      if (await destFile.exists()) {
        final timestamp = DateTime.now().millisecondsSinceEpoch;

        final name = path.basenameWithoutExtension(fileName);
        final ext = path.extension(fileName);

        savedPath = path.join(dir.path, '${name}_$timestamp$ext');
        destFile = File(savedPath);
      }

      await sourceFile.copy(savedPath);
      return savedPath;
    }),
  );

  return results;
}