import 'dart:convert';

RegistrasiStatusModel registrasiStatusModelFromJson(String str) => RegistrasiStatusModel.fromJson(json.decode(str));

String registrasiStatusModelToJson(RegistrasiStatusModel data) => json.encode(data.toJson());

class RegistrasiStatusModel {
    final Meta? meta;
    final Data? data;

    RegistrasiStatusModel({
        this.meta,
        this.data,
    });

    factory RegistrasiStatusModel.fromJson(Map<String, dynamic> json) => RegistrasiStatusModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data?.toJson(),
    };
}

class Data {
    final String? statusApprove;
    final String? statusActive;

    Data({
        this.statusApprove,
        this.statusActive,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        statusApprove: json["status_approve"] == null ? '0' : json["status_approve"].toString(),
        statusActive: json["status_active"] == null ? '0' : json["status_active"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "status_approve": statusApprove == null ? '0' : statusApprove.toString(),
        "status_active": statusActive == null ? '0' : statusActive.toString(),
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
