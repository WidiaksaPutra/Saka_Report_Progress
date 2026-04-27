// To parse this JSON data, do
//
//     final informasiAplikasiModel = informasiAplikasiModelFromJson(jsonString);

import 'dart:convert';

InformasiAplikasiModel informasiAplikasiModelFromJson(String str) => InformasiAplikasiModel.fromJson(json.decode(str));

String informasiAplikasiModelToJson(InformasiAplikasiModel data) => json.encode(data.toJson());

class InformasiAplikasiModel {
    final Meta? meta;
    final String? data;

    InformasiAplikasiModel({
        this.meta,
        this.data,
    });

    factory InformasiAplikasiModel.fromJson(Map<String, dynamic> json) => InformasiAplikasiModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data,
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
