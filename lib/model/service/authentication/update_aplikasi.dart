// To parse this JSON data, do
//
//     final updateAplikasiModel = updateAplikasiModelFromJson(jsonString);

import 'dart:convert';

UpdateAplikasiModel updateAplikasiModelFromJson(String str) => UpdateAplikasiModel.fromJson(json.decode(str));

String updateAplikasiModelToJson(UpdateAplikasiModel data) => json.encode(data.toJson());

class UpdateAplikasiModel {
    final Meta? meta;
    final bool? isRegistered;

    UpdateAplikasiModel({
        this.meta,
        this.isRegistered,
    });

    factory UpdateAplikasiModel.fromJson(Map<String, dynamic> json) => UpdateAplikasiModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        isRegistered: json["isRegistered"],
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "isRegistered": isRegistered,
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
