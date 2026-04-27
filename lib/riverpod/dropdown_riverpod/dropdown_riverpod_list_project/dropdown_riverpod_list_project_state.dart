class DropdownRiverpodListProjectState {
  final String message, statusCode;
  final List data;
  
  const DropdownRiverpodListProjectState({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  DropdownRiverpodListProjectState copyWith({
    String? message, statusCode,
    List? data,
  }) {
    return DropdownRiverpodListProjectState(
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      data: data ?? this.data,
    );
  }
}
