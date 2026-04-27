class FormLoginRiverpodState {
  final int statusDialog;
  final String message, statusCode;
  
  const FormLoginRiverpodState({
    required this.statusDialog,
    required this.message,
    required this.statusCode,
  });

  FormLoginRiverpodState copyWith({
    int? statusDialog,
    String? message, statusCode,
  }) {
    return FormLoginRiverpodState(
      statusDialog: statusDialog ?? this.statusDialog,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
