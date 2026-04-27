class DropdownRiverpodListTypeState {
  final String message, statusCode;
  final List data;
  
  const DropdownRiverpodListTypeState({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  DropdownRiverpodListTypeState copyWith({
    String? message, statusCode,
    List? data,
  }) {
    return DropdownRiverpodListTypeState(
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      data: data ?? this.data,
    );
  }
}
