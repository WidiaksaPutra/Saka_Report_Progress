Map<String, double> linkMapsToLatlng({required String url}) {
  final RegExp regex = RegExp(r"@(-?\d+\.\d+),(-?\d+\.\d+),"); // Regex untuk mencari latitude dan longitude
  final match = regex.firstMatch(url);

  if (match != null && match.groupCount == 2) {
    double latitude = double.parse(match.group(1)!);
    double longitude = double.parse(match.group(2)!);
    return {'latitude': latitude, 'longitude': longitude};
  }
  return {}; // Jika tidak ditemukan koordinat
}