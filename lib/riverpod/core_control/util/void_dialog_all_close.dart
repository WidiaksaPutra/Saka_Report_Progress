import 'package:sales_progress_report/routes/page_routes.dart';

void closeAllDialogs() {
  navigatorKey.currentState?.popUntil((route) => route.isFirst);
}