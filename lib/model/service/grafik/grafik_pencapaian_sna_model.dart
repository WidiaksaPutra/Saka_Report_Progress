// To parse this JSON data, do
//
//     final grafikPencapaianSnaModel = grafikPencapaianSnaModelFromJson(jsonString);

import 'dart:convert';

GrafikPencapaianSnaModel grafikPencapaianSnaModelFromJson(String str) => GrafikPencapaianSnaModel.fromJson(json.decode(str));

String grafikPencapaianSnaModelToJson(GrafikPencapaianSnaModel data) => json.encode(data.toJson());

class GrafikPencapaianSnaModel {
    final Meta? meta;
    final List<Datum>? data;

    GrafikPencapaianSnaModel({
        this.meta,
        this.data,
    });

    factory GrafikPencapaianSnaModel.fromJson(Map<String, dynamic> json) => GrafikPencapaianSnaModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? sna;
    final String? target;
    final String? actual;

    Datum({
        this.sna,
        this.target,
        this.actual,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        sna: json["sna"] == null ? '0' : json["sna"].toString(),
        target: json["target"] == null ? '0' : json["target"].toString(),
        actual: json["actual"] == null ? '0' : json["actual"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "sna": sna == null ? '0' : sna.toString(),
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