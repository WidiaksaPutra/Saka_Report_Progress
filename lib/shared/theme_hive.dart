// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
import 'package:sales_progress_report/main/hive_init.dart';
import 'package:sales_progress_report/model/hive/dropdown/dropdown_list_project_progress_report/dropdown_list_project_progress_report.dart';
import 'package:sales_progress_report/model/hive/dropdown/dropdown_list_type_progress_report/dropdown_list_type_progress_report.dart';

class HiveBoxes {

  static Future<Box<T>> _openBox<T>(String name) async {
    final cached = HiveService.instance.getCachedBox<T>(name);
    if (cached != null) return cached;

    final box = await HiveService.instance.getBox<T>(name);
    return box;
  }

  static Box<T> box<T>(String name) => Hive.box<T>(name);

  static Future<Box<bool>> get modeOnlineBox => _openBox<bool>('mode_online');
  static Future<Box<String>> get registerStatusBox => _openBox<String>('registerStatusBox');
  static Future<Box<String>> get usernameBox => _openBox<String>('username');
  static Future<Box<String>> get passwordBox => _openBox<String>('password');
  static Future<Box<String>> get userStorageBox => _openBox<String>('user_storage');
  static Future<Box<DropdownListTypeProgressReportHive>> get dropdownListTypeProgressReportBox => _openBox<DropdownListTypeProgressReportHive>('dropdown_list_type_progress_report');
  static Future<Box<DropdownListProjectProgressReportHive>> get dropdownListProjectProgressReportBox => _openBox<DropdownListProjectProgressReportHive>('dropdown_list_project_progress_report');
  static Future<Box<List<String>>> get listGambarFormLaporanBox => _openBox<List<String>>('list_gambar_form_laporan');
  static Future<Box<String>> get textFormLaporanBox => _openBox<String>('text_form_laporan');
}

final usernameBox = HiveBoxes.usernameBox;
final passwordBox = HiveBoxes.passwordBox;
final modeOnlineBox = HiveBoxes.modeOnlineBox;
final userStorageBox = HiveBoxes.userStorageBox;
final dropdownListProjectProgressReportBox = HiveBoxes.dropdownListProjectProgressReportBox;
final dropdownListTypeProgressReportBox = HiveBoxes.dropdownListTypeProgressReportBox;
final listGambarFormLaporanBox = HiveBoxes.listGambarFormLaporanBox;
final textFormLaporanBox = HiveBoxes.textFormLaporanBox;