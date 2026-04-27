// To parse this JSON data, do
//
//     final registrasiModel = registrasiModelFromJson(jsonString);

import 'dart:convert';

RegistrasiModel registrasiModelFromJson(String str) => RegistrasiModel.fromJson(json.decode(str));

String registrasiModelToJson(RegistrasiModel data) => json.encode(data.toJson());

class RegistrasiModel {
    final Meta? meta;

    RegistrasiModel({
        this.meta,
    });

    factory RegistrasiModel.fromJson(Map<String, dynamic> json) => RegistrasiModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
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
