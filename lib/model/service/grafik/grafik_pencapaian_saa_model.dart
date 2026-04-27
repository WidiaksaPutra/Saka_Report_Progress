// To parse this JSON data, do
//
//     final grafikPencapaianSaaModel = grafikPencapaianSaaModelFromJson(jsonString);

import 'dart:convert';

GrafikPencapaianSaaModel grafikPencapaianSaaModelFromJson(String str) => GrafikPencapaianSaaModel.fromJson(json.decode(str));

String grafikPencapaianSaaModelToJson(GrafikPencapaianSaaModel data) => json.encode(data.toJson());

class GrafikPencapaianSaaModel {
    final Meta? meta;
    final Data? data;

    GrafikPencapaianSaaModel({
        this.meta,
        this.data,
    });

    factory GrafikPencapaianSaaModel.fromJson(Map<String, dynamic> json) => GrafikPencapaianSaaModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data?.toJson(),
    };
}

class Data {
    final String? target;
    final String? actual;

    Data({
        this.target,
        this.actual,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        target: json["target"] == null ? '0' : json["target"].toString(),
        actual: json["actual"] == null ? '0' : json["actual"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "target": target == null ? '0' : target.toString(),
        "actual": actual == null ? '0' : actual.toString(),
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