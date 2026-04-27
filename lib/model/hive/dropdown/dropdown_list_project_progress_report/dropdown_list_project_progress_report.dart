import 'package:hive/hive.dart';

part 'dropdown_list_project_progress_report.g.dart';
//  flutter packages pub run build_runner build
@HiveType(typeId: 2)
class DropdownListProjectProgressReportHive extends HiveObject{

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final String label;

  DropdownListProjectProgressReportHive({
    required this.id,
    required this.type,
    required this.label,
  });
}