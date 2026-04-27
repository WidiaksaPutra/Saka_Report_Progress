String linkDecodeUrlMaps(String encodedUrl) {
  String decodedUrl = encodedUrl
      .replaceAll('%20', '+')
      .replaceAll('%2B', '+')
      .replaceAll('%2C', ',')
      .replaceAll('%2F', '/');
  decodedUrl = decodedUrl.replaceAll(
      'hl=de', 'hl=id');
  return decodedUrl;
}