Future<void> runWithRetry(Future<void> Function() task) async {
  int retry = 0;
  while (retry < 5) {
    try {
      await task();
      return;
    } catch (e) {
      if (e.toString().contains("429")) {
        await Future.delayed(Duration(seconds: 2 * (retry + 1)));
        retry++;
      } else {
        rethrow;
      }
    }
  }
}
