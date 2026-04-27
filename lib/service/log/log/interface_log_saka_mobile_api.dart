// ignore_for_file: non_constant_identifier_names, camel_case_types
abstract class InterfaceLogSakaMobileApi{
  Future<void> logSakaMobile({
    required String username,
    required String module,
    required String transactionType,
    required String actionDetails,
    required String status,
    required String tableName,
  });
}