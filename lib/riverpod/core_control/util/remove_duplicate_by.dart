List<T> removeDuplicateBy<T>(List<T> list, String Function(T) keySelector) {
  final seen = <String>{};
  return list.where((item) {
    final key = keySelector(item);
    if (seen.contains(key)) return false;
    seen.add(key);
    return true;
  }).toList();
}