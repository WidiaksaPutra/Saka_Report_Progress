// ignore_for_file: unrelated_type_equality_checks

bool notNullValidasi(String? value){
  return value != null && value.isNotEmpty && value != "null" && value != [] && value != "[]";
}

bool nullValidasi(String? value){
  return value == null && value!.isEmpty && value == "null" && value != [] && value != "[]";
}

bool notNullValidasiOr(String? value){
  return value != null || value!.isNotEmpty || value != "null" || value != [] || value != "[]";
}

bool nullValidasiOr(String? value){
  return value == null || value.isEmpty || value == "null" || value != [] || value != "[]";
}