// To parse this JSON data, do
//
//     final modelListProjectDropdownProgressReport = modelListProjectDropdownProgressReportFromJson(jsonString);

import 'dart:convert';

ModelListProjectDropdownProgressReport modelListProjectDropdownProgressReportFromJson(String str) => ModelListProjectDropdownProgressReport.fromJson(json.decode(str));

String modelListProjectDropdownProgressReportToJson(ModelListProjectDropdownProgressReport data) => json.encode(data.toJson());

class ModelListProjectDropdownProgressReport {
    final Meta? meta;
    final List<Datum>? data;

    ModelListProjectDropdownProgressReport({
        this.meta,
        this.data,
    });

    factory ModelListProjectDropdownProgressReport.fromJson(Map<String, dynamic> json) => ModelListProjectDropdownProgressReport(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final int? id;
    final String? label;

    Datum({
        this.id,
        this.label,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
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