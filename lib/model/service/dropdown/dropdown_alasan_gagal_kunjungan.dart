// To parse this JSON data, do
//
//     final dropdownAlasanGagalKunjunganModel = dropdownAlasanGagalKunjunganModelFromJson(jsonString);

import 'dart:convert';

DropdownAlasanGagalKunjunganModel dropdownAlasanGagalKunjunganModelFromJson(String str) => DropdownAlasanGagalKunjunganModel.fromJson(json.decode(str));

String dropdownAlasanGagalKunjunganModelToJson(DropdownAlasanGagalKunjunganModel data) => json.encode(data.toJson());

class DropdownAlasanGagalKunjunganModel {
    final Meta? meta;
    final List<Datum>? data;

    DropdownAlasanGagalKunjunganModel({
        this.meta,
        this.data,
    });

    factory DropdownAlasanGagalKunjunganModel.fromJson(Map<String, dynamic> json) => DropdownAlasanGagalKunjunganModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final int? index;
    final String? description;

    Datum({
        this.index,
        this.description,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        index: json["index"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "description": description,
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
