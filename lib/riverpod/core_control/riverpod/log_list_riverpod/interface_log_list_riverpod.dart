abstract class InterfaceLogListRiverpod{
  Future<void> logSaveLocalListData({
    required String username,
    required String module,
    required String transactionType,
    required String actionDetails, 
    required String status,
    required String tableName,
  });

  Future<void> logListData();
}

