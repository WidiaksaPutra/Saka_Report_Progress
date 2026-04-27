// ignore_for_file: non_constant_identifier_names
abstract class InterfacePostFormLaporan{
  late String urlPostFormLaporan = "";
  late String status = "";
  late String message = "";
  late String code = "";
  
  Future postFormLaporan({
    required String id, 
    required String reportDescription, 
    required List<String?> reportImages,
    required String type,
    required String title,
    required String projectInputType,
    required String token,
  });
}