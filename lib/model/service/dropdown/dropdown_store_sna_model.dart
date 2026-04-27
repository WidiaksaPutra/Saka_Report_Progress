// To parse this JSON data, do
//
//     final dropdownStoreSnaModel = dropdownStoreSnaModelFromJson(jsonString);

import 'dart:convert';

DropdownStoreSnaModel dropdownStoreSnaModelFromJson(String str) => DropdownStoreSnaModel.fromJson(json.decode(str));

String dropdownStoreSnaModelToJson(DropdownStoreSnaModel data) => json.encode(data.toJson());

class DropdownStoreSnaModel {
    final Meta? meta;
    final String? totalItems;
    final List<Datum>? data;

    DropdownStoreSnaModel({
        this.meta,
        this.totalItems,
        this.data,
    });

    factory DropdownStoreSnaModel.fromJson(Map<String, dynamic> json) => DropdownStoreSnaModel(
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
    final String? ledger;
    final String? alamatToko;
    final String? latitude;
    final String? longitude;
    final String? radius;
    final String? lob;
    final String? salesCode;
    final String? dataDuration;

    Datum({
        this.namaToko,
        this.ledger,
        this.alamatToko,
        this.latitude,
        this.longitude,
        this.radius,
        this.lob,
        this.salesCode,
        this.dataDuration,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        namaToko: (json["nama_toko"] == null) ? '' : json["nama_toko"].toString(),
        ledger: (json["ledger"] == null) ? '' : json["ledger"].toString(),
        alamatToko: (json["alamat_toko"] == null) ? '' : json["alamat_toko"].toString(),
        latitude: (json["latitude"] == null) ? '0.0' : json["latitude"].toString(),
        longitude: (json["longitude"] == null) ? '0.0' : json["longitude"].toString(),
        radius: (json["radius"] == null) ? '0.0' : json["radius"].toString(),
        lob: (json["lob"] == null) ? '' : json["lob"].toString(),
        salesCode: (json["sales_code"] == null) ? '' : json["sales_code"].toString(),
        dataDuration: (json["data_duration"] == null) ? '30' : json["data_duration"].toString() 
    );

    Map<String, dynamic> toJson() => {
        "nama_toko": (namaToko == null) ? '' : namaToko.toString(),
        "ledger": (ledger == null) ? '' : ledger.toString(),
        "alamat_toko": (alamatToko == null) ? '' : alamatToko.toString(),
        "latitude": (latitude == null) ? '0.0' : latitude.toString(),
        "longitude": (longitude == null) ? '0.0' : longitude.toString(),
        "radius": (radius == null) ? '0.0' : radius.toString(),
        "lob": (lob == null) ? '' : lob.toString(),
        "sales_code": (salesCode == null) ? '' : salesCode.toString(),
        "data_duration": (dataDuration == null) ? '30' : dataDuration.toString(),
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