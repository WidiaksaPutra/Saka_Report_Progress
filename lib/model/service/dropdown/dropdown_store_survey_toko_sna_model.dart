import 'dart:convert';

DropdownStoreSurveyTokoSnaModel dropdownStoreSurveyTokoSnaModelFromJson(String str) => DropdownStoreSurveyTokoSnaModel.fromJson(json.decode(str));

String dropdownStoreSurveyTokoSnaModelToJson(DropdownStoreSurveyTokoSnaModel data) => json.encode(data.toJson());

class DropdownStoreSurveyTokoSnaModel {
    final Meta? meta;
    final String? totalItems;
    final List<Datum>? data;

    DropdownStoreSurveyTokoSnaModel({
        this.meta,
        this.totalItems,
        this.data,
    });

    factory DropdownStoreSurveyTokoSnaModel.fromJson(Map<String, dynamic> json) => DropdownStoreSurveyTokoSnaModel(
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
    final String? namaToko;
    final String? alamatToko;
    final String? latitude;
    final String? longitude;
    final String? totalSurvey;
    final String? radius;

    Datum({
        this.namaToko,
        this.alamatToko,
        this.latitude,
        this.longitude,
        this.totalSurvey,
        this.radius,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        namaToko: (json["nama_toko"] == null) ? '' : json["nama_toko"].toString(),
        alamatToko: (json["alamat_toko"] == null) ? '' : json["alamat_toko"].toString(),
        latitude: (json["latitude"] == null) ? '0.0' : json["latitude"].toString(),
        longitude: (json["longitude"] == null) ? '0.0' : json["longitude"].toString(),
        totalSurvey: (json["total_survey"] == null) ? '0' : json["total_survey"].toString(),
        radius: (json["radius"] == null) ? '0.0' : json["radius"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "nama_toko": (namaToko == null) ? '' : namaToko.toString(),
        "alamat_toko": (alamatToko == null) ? '' : alamatToko.toString(),
        "latitude": (latitude == null) ? '0.0' : latitude.toString(),
        "longitude": (longitude == null) ? '0.0' : longitude.toString(),
        "total_survey": (totalSurvey == null) ? '0' : totalSurvey.toString(),
        "radius": (radius == null) ? '0.0' : radius.toString(),
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