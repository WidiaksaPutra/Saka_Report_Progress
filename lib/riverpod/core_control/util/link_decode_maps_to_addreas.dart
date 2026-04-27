String linkDecodeMapsToAddreas(String decodeUrl) {
  var parts = decodeUrl.split('place/');
  
  if (parts.length > 1) {
    List<String> nameAndData = parts[1].split('/data');
    return nameAndData[0].toString();
  } else {
    return '';
  }
}