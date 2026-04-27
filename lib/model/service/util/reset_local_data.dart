// To parse this JSON data, do
//
//     final resetLocalDataMpdel = resetLocalDataMpdelFromJson(jsonString);

import 'dart:convert';

ResetLocalDataModel resetLocalDataMpdelFromJson(String str) => ResetLocalDataModel.fromJson(json.decode(str));

String resetLocalDataMpdelToJson(ResetLocalDataModel data) => json.encode(data.toJson());

class ResetLocalDataModel {
    final Meta? meta;
    final bool? reset;

    ResetLocalDataModel({
        this.meta,
        this.reset,
    });

    factory ResetLocalDataModel.fromJson(Map<String, dynamic> json) => ResetLocalDataModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        reset: json["reset"],
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "reset": reset,
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
