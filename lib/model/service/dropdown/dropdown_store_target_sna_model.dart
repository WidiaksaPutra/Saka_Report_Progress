// To parse this JSON data, do
//
//     final listReportTargetSnaModel = listReportTargetSnaModelFromJson(jsonString);

import 'dart:convert';

DropdownStoreTargetSnaModel dropdownStoreTargetSnaModelFromJson(String str) => DropdownStoreTargetSnaModel.fromJson(json.decode(str));

String dropdownStoreTargetSnaModelToJson(DropdownStoreTargetSnaModel data) => json.encode(data.toJson());

class DropdownStoreTargetSnaModel {
    final Meta? meta;
    final int? totalItems;
    final List<Datum>? data;

    DropdownStoreTargetSnaModel({
        this.meta,
        this.totalItems,
        this.data,
    });

    factory DropdownStoreTargetSnaModel.fromJson(Map<String, dynamic> json) => DropdownStoreTargetSnaModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        totalItems: json["total_items"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "total_items": totalItems,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? namaToko;
    final String? ledger;
    final String? alamatToko;
    final String? lob;
    final String? latitude;
    final String? longitude;
    final String? salesCode;
    final int? radius;
    final String? tipeToko;

    Datum({
        this.namaToko,
        this.ledger,
        this.alamatToko,
        this.lob,
        this.latitude,
        this.longitude,
        this.salesCode,
        this.radius,
        this.tipeToko,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        namaToko: json["nama_toko"],
        ledger: json["ledger"],
        alamatToko: json["alamat_toko"],
        lob: json["lob"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        salesCode: json["sales_code"],
        radius: json["radius"],
        tipeToko: json["tipe_toko"],
    );

    Map<String, dynamic> toJson() => {
        "nama_toko": namaToko,
        "ledger": ledger,
        "alamat_toko": alamatToko,
        "lob": lob,
        "latitude": latitude,
        "longitude": longitude,
        "sales_code": salesCode,
        "radius": radius,
        "tipe_toko": tipeToko,
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