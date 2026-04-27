// To parse this JSON data, do
//
//     final kodeItemSnaModel = kodeItemSnaModelFromJson(jsonString);

import 'dart:convert';

KodeItemSnaModel kodeItemSnaModelFromJson(String str) => KodeItemSnaModel.fromJson(json.decode(str));

String kodeItemSnaModelToJson(KodeItemSnaModel data) => json.encode(data.toJson());

class KodeItemSnaModel {
    final Meta? meta;
    final List<String>? data;

    KodeItemSnaModel({
        this.meta,
        this.data,
    });

    factory KodeItemSnaModel.fromJson(Map<String, dynamic> json) => KodeItemSnaModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
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
