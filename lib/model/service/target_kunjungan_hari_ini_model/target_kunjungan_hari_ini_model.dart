// To parse this JSON data, do
//
//     final targetKunjunganHariIniModel = targetKunjunganHariIniModelFromJson(jsonString);

import 'dart:convert';

TargetKunjunganHariIniModel targetKunjunganHariIniModelFromJson(String str) => TargetKunjunganHariIniModel.fromJson(json.decode(str));

String targetKunjunganHariIniModelToJson(TargetKunjunganHariIniModel data) => json.encode(data.toJson());

class TargetKunjunganHariIniModel {
    final Meta? meta;
    final List<Datum>? data;

    TargetKunjunganHariIniModel({
        this.meta,
        this.data,
    });

    factory TargetKunjunganHariIniModel.fromJson(Map<String, dynamic> json) => TargetKunjunganHariIniModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? id;
    final String? date;
    final String? reportStatus;
    final String? code;
    final String? name;
    final String? type;
    final String? checkInStatus;
    final String? checkInAt;
    final String? checkOutAt;
    final String? duration;
    final List<String>? company;
    final String? notActiveStatus;

    Datum({
        this.id,
        this.date,
        this.reportStatus,
        this.code,
        this.name,
        this.type,
        this.checkInStatus,
        this.checkInAt,
        this.checkOutAt,
        this.duration,
        this.company,
        this.notActiveStatus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: (json["id"] == null) ? "-" : json["id"].toString(),
        date: (json["date"] == null) ? "null" : json["date"].toString(),
        reportStatus: (json["report_status"] == null) ? "-" : json["report_status"].toString(),
        code: (json["code"] == null) ? "-" : json["code"].toString(),
        name: (json["name"] == null) ? "-" : json["name"].toString(),
        type: (json["type"] == null) ? "-" : json["type"].toString(),
        checkInStatus: (json["check_in_status"] == null) ? "-" : json["check_in_status"].toString(),
        checkInAt: (json["check_in_at"] == null) ? "null" : json["check_in_at"].toString(),
        checkOutAt: (json["check_out_at"] == null) ? "null" : json["check_out_at"].toString(),
        duration: (json["duration"] == null) ? "-" : json["duration"].toString(),
        company: (json["company"] == null || json["company"].isEmpty) ? [] : List<String>.from(json["company"]!.map((x) => x)),
        notActiveStatus: (json["not_active_status"] == null) ? "-" : json["not_active_status"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": (id == null) ? "-" : id.toString(),
        "date": (date == null) ? "null" : date.toString(),
        "report_status": (reportStatus == null) ? "-" : reportStatus.toString(),
        "code": (code == null) ? "-" : code.toString(),
        "name": (name == null) ? "-" : name.toString(),
        "type": (type == null) ? "-" : type.toString(),
        "check_in_status": (checkInStatus == null) ? "-" : checkInStatus.toString(),
        "check_in_at": (checkInAt == null) ? "null" : checkInAt.toString(),
        "check_out_at": (checkOutAt == null) ? "null" : checkOutAt.toString(),
        "duration": (duration == null) ? "-" : duration.toString(),
        "company": (company == null || company!.isEmpty) ? [] : List<dynamic>.from(company!.map((x) => x)),
        "not_active_status": (notActiveStatus == null) ? "null" : notActiveStatus.toString(),
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
