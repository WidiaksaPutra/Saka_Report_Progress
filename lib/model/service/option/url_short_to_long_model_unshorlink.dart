// // To parse this JSON data, do
// //
// //     final urlShortToLongModel = urlShortToLongModelFromJson(jsonString);

// import 'dart:convert';

// UrlShortToLongModel urlShortToLongModelFromJson(String str) => UrlShortToLongModel.fromJson(json.decode(str));

// String urlShortToLongModelToJson(UrlShortToLongModel data) => json.encode(data.toJson());

// class UrlShortToLongModel {
//     final String? unshortenedUrl;
//     final String? shortenedUrl;
//     final bool? success;

//     UrlShortToLongModel({
//         this.unshortenedUrl,
//         this.shortenedUrl,
//         this.success,
//     });

//     factory UrlShortToLongModel.fromJson(Map<String, dynamic> json) => UrlShortToLongModel(
//         unshortenedUrl: json["unshortened_url"],
//         shortenedUrl: json["shortened_url"],
//         success: json["success"],
//     );

//     Map<String, dynamic> toJson() => {
//         "unshortened_url": unshortenedUrl,
//         "shortened_url": shortenedUrl,
//         "success": success,
//     };
// }