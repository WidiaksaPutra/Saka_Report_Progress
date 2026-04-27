// To parse this JSON data, do
//
//     final modelListTypeDropdownProgressReport = modelListTypeDropdownProgressReportFromJson(jsonString);

import 'dart:convert';

ModelListTypeDropdownProgressReport modelListTypeDropdownProgressReportFromJson(String str) => ModelListTypeDropdownProgressReport.fromJson(json.decode(str));

String modelListTypeDropdownProgressReportToJson(ModelListTypeDropdownProgressReport data) => json.encode(data.toJson());

class ModelListTypeDropdownProgressReport {
    final Meta? meta;
    final List<Datum>? data;

    ModelListTypeDropdownProgressReport({
        this.meta,
        this.data,
    });

    factory ModelListTypeDropdownProgressReport.fromJson(Map<String, dynamic> json) => ModelListTypeDropdownProgressReport(
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
    final String? type;
    final String? projectInputType;

    Datum({
        this.id,
        this.type,
        this.projectInputType,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        projectInputType: json["project_input_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "project_input_type": projectInputType,
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