// To parse this JSON data, do
//
//     final dropdownProyekSurveySnaModel = dropdownProyekSurveySnaModelFromJson(jsonString);

import 'dart:convert';

DropdownProyekSurveySnaModel dropdownProyekSurveySnaModelFromJson(String str) => DropdownProyekSurveySnaModel.fromJson(json.decode(str));

String dropdownProyekSurveySnaModelToJson(DropdownProyekSurveySnaModel data) => json.encode(data.toJson());

class DropdownProyekSurveySnaModel {
    final Meta? meta;
    final String? totalItems;
    final List<Datum>? data;

    DropdownProyekSurveySnaModel({
        this.meta,
        this.totalItems,
        this.data,
    });

    factory DropdownProyekSurveySnaModel.fromJson(Map<String, dynamic> json) => DropdownProyekSurveySnaModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        totalItems: json["total_items"] == null ? '0' : json["total_items"].toString(),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "total_items": totalItems == null ? '0' : totalItems.toString(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? id;
    final String? ledger;
    final String? namaToko;
    final String? namaProject;
    final String? alamatToko;
    final String? alamat;
    final String? latitude;
    final String? longitude;
    final String? radius;
    final String? totalSurvey;

    Datum({
        this.id,
        this.ledger,
        this.namaToko,
        this.namaProject,
        this.alamatToko,
        this.alamat,
        this.latitude,
        this.longitude,
        this.radius,
        this.totalSurvey,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? '0' : json["id"].toString(),
        ledger: json["ledger"] == null ? '' : json["ledger"].toString(),
        namaToko: json["nama_toko"] == null ? '' : json["nama_toko"].toString(),
        namaProject: json["nama_project"] == null ? '' : json["nama_project"].toString(),
        alamatToko: json["alamat_toko"] == null ? '' : json["alamat_toko"].toString(),
        alamat: json["alamat"] == null ? '' : json["alamat"].toString(),
        latitude: (json["latitude"] == null) ? '0.0' : json["latitude"].toString(),
        longitude: (json["longitude"] == null) ? '0.0' : json["longitude"].toString(),
        radius: (json["radius"] == null) ? '0.0' : json["radius"].toString(),
        totalSurvey: (json["total_survey"] == null) ? '0' : json["total_survey"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? '0' : id.toString(),
        "ledger": ledger == null ? '' : ledger.toString(),
        "nama_toko": namaToko == null ? '' : namaToko.toString(),
        "nama_project": namaProject == null ? '' : namaProject.toString(),
        "alamat_toko": alamatToko == null ? '' : alamatToko.toString(),
        "alamat": alamat == null ? '' : alamat.toString(),
        "latitude": (latitude == null) ? '0.0' : latitude.toString(),
        "longitude": (longitude == null) ? '0.0' : longitude.toString(),
        "radius": (radius == null) ? '0.0' : radius.toString(),
        "total_survey": (totalSurvey == null) ? '0' : totalSurvey.toString() ,
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