// To parse this JSON data, do
//
//     final urlShortToLongModel = urlShortToLongModelFromJson(jsonString);

import 'dart:convert';

UrlShortToLongModel urlShortToLongModelFromJson(String str) => UrlShortToLongModel.fromJson(json.decode(str));

String urlShortToLongModelToJson(UrlShortToLongModel data) => json.encode(data.toJson());

class UrlShortToLongModel {
    final Meta? meta;
    final String? url;

    UrlShortToLongModel({
        this.meta,
        this.url,
    });

    factory UrlShortToLongModel.fromJson(Map<String, dynamic> json) => UrlShortToLongModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "url": url,
    };
}

class Meta {
    final int? code;
    final String? status;
    final String? message;

    Meta({
        this.code,
        this.status,
        this.message,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
    };
}
