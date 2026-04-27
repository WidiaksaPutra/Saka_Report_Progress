abstract class InterfaceLogRiverpod{
  Future<void> logData({
    required String username,
    required String module,
    required String transactionType,
    required String actionDetails, 
    required String status,
    required String tableName,
  });
}

