// To parse this JSON data, do
//
//     final modelMeta = modelMetaFromJson(jsonString);

import 'dart:convert';

ModelMeta modelMetaFromJson(String str) => ModelMeta.fromJson(json.decode(str));

String modelMetaToJson(ModelMeta data) => json.encode(data.toJson());

class ModelMeta {
    final Meta? meta;

    ModelMeta({
        this.meta,
    });

    factory ModelMeta.fromJson(Map<String, dynamic> json) => ModelMeta(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
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
