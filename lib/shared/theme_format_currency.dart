import 'package:intl/intl.dart';

NumberFormat formatCurrency = NumberFormat.currency(
  locale: 'id_ID',
  decimalDigits: 2,
  symbol: "Rp",
);

NumberFormat formatCurrencyNotSymbol = NumberFormat.currency(
  locale: 'id_ID',
  decimalDigits: 2,
  symbol: "",
);

NumberFormat formatCurrencyNotSymbolNotDecimal = NumberFormat.currency(
  locale: 'id_ID',
  decimalDigits: 0,
  symbol: "",
);

NumberFormat formatCurrencyShort = NumberFormat.compact(locale: "id_ID", explicitSign: false);