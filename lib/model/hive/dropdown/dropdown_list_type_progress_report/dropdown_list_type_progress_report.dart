import 'package:hive/hive.dart';

part 'dropdown_list_type_progress_report.g.dart';
//  flutter packages pub run build_runner build
@HiveType(typeId: 1)
class DropdownListTypeProgressReportHive extends HiveObject{

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final String projectInputType;

  DropdownListTypeProgressReportHive({
    required this.id, 
    required this.type,
    required this.projectInputType,
  });
}