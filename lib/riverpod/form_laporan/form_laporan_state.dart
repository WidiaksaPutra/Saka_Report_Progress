class FormLaporanState {
  final String message, code, status;
  
  const FormLaporanState({
    required this.code,
    required this.status,
    required this.message,
  });

  FormLaporanState copyWith({
    required String? code, 
    required String? status, 
    required String? message
  }) {
    return FormLaporanState(
      code: code!,
      status: status!,
      message: message!
    );
  }
}
