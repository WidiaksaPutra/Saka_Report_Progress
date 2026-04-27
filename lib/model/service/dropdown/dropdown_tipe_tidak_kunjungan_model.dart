// To parse this JSON data, do
//
//     final dropdownTipeTidakKunjunganModel = dropdownTipeTidakKunjunganModelFromJson(jsonString);

import 'dart:convert';

DropdownTipeTidakKunjunganModel dropdownTipeTidakKunjunganModelFromJson(String str) => DropdownTipeTidakKunjunganModel.fromJson(json.decode(str));

String dropdownTipeTidakKunjunganModelToJson(DropdownTipeTidakKunjunganModel data) => json.encode(data.toJson());

class DropdownTipeTidakKunjunganModel {
    final Meta meta;
    final List<Datum> data;

    DropdownTipeTidakKunjunganModel({
        required this.meta,
        required this.data,
    });

    factory DropdownTipeTidakKunjunganModel.fromJson(Map<String, dynamic> json) => DropdownTipeTidakKunjunganModel(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final int type;
    final String name;

    Datum({
        required this.type,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
    };
}

class Meta {
    final int code;
    final String status;
    final String message;

    Meta({
        required this.code,
        required this.status,
        required this.message,
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
