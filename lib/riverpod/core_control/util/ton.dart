class Ton{
  double ton({required double data}) {
    try {
      return data/1000.0;
    } catch (e) {
      throw Exception('Encryption failed: $e');
    }
  }
}
