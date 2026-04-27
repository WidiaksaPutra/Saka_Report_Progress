class Persen{
  double persen({required int actual, required int target}) {
    try {
      return (actual/target * 100.0);
    } catch (e) {
      throw Exception('Encryption failed: $e');
    }
  }

  double sisaPersen({required int persen}){
    try {
      return 100.0 - persen;
    } catch (e) {
      throw Exception('Encryption failed: $e');
    }
  }

  double persentaseKunjunganReport({
    required int data,
    required int total,
  }) {
    try {
      return (data/total * 100.0);
    } catch (e) {
      throw Exception('Encryption failed: $e');
    }
  }
}