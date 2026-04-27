class ModelTokenEnkripsi{
  final dynamic tokenEnkripsi;

  ModelTokenEnkripsi({
    required this.tokenEnkripsi,
  });

  Map<String, dynamic> toJson() => {
    'token_enkripsi': tokenEnkripsi,
  };
}