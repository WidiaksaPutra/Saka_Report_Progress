abstract class InterfaceFormLaporan{
  Future<void> formLaporan({
    required String id, 
    required String projectInputType,
    required String reportDescription,
    required String type,
    required String title,
    required List<String> reportImages,
  });
}