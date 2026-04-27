// To parse this JSON data, do
//
//     final dropdownStatusApprovalModel = dropdownStatusApprovalModelFromJson(jsonString);

import 'dart:convert';

DropdownStatusApprovalModel dropdownStatusApprovalModelFromJson(String str) => DropdownStatusApprovalModel.fromJson(json.decode(str));

String dropdownStatusApprovalModelToJson(DropdownStatusApprovalModel data) => json.encode(data.toJson());

class DropdownStatusApprovalModel {
    final Meta? meta;
    final List<Datum>? data;

    DropdownStatusApprovalModel({
        this.meta,
        this.data,
    });

    factory DropdownStatusApprovalModel.fromJson(Map<String, dynamic> json) => DropdownStatusApprovalModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? index;
    final String? text;
    final String? icon;

    Datum({
        this.index,
        this.text,
        this.icon,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        index: (json["index"] == null) ? "" : json["index"].toString(),
        text: (json["text"] == null) ? "" : json["text"].toString(),
        icon: (json["icon"] == null) ? "" : json["icon"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "index": (index == null) ? "" : index.toString(),
        "text": (text == null) ? "" : text.toString(),
        "icon": (icon == null) ? "" : icon.toString(),
    };
}

class Meta {
    final String? code;
    final String? status;
    final String? message;

    Meta({
        this.code,
        this.status,
        this.message,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: (json["code"] == null) ? "" : json["code"].toString(),
        status: (json["status"] == null) ? "" : json["status"].toString(),
        message: (json["message"] == null) ? "" : json["message"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "code": (code == null) ? "" : code.toString(),
        "status": (status == null) ? "" : status.toString(),
        "message": (message == null) ? "" : message.toString(),
    };
}
