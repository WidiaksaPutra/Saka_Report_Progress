// ignore_for_file: no_leading_underscores_for_local_identifiers

// final List hakAksesPositionSnaSaa = ["SSS", "HOO", "PJSHO", "PJSRM"];
// final List hakAksesKodeSalesSnaSaa = ["OFFICE"]; //SALES
// required String position, 
Future<bool> hakAkses({required String role}) async{
  try {
    late bool _valueAkses = false;
    // for(String data in hakAksesPositionSnaSaa){
    //   if(position == data){
    //     _valueAkses = true;
    //   }
    // }
    // if(_valueAkses == false){
      // for(String data in hakAksesKodeSalesSnaSaa){
        if(role == "office" && _valueAkses == false){
          _valueAkses = true;
        }
      // }
    // }
    return _valueAkses;
  }catch(e){
    return false;
  }
}