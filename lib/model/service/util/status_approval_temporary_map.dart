// To parse this JSON data, do
//
//     final statusApprovalTemporaryMap = statusApprovalTemporaryMapFromJson(jsonString);

import 'dart:convert';

StatusApprovalTemporaryMap statusApprovalTemporaryMapFromJson(String str) => StatusApprovalTemporaryMap.fromJson(json.decode(str));

String statusApprovalTemporaryMapToJson(StatusApprovalTemporaryMap data) => json.encode(data.toJson());

class StatusApprovalTemporaryMap {
    final Meta? meta;
    final List<Datum>? data;

    StatusApprovalTemporaryMap({
        this.meta,
        this.data,
    });

    factory StatusApprovalTemporaryMap.fromJson(Map<String, dynamic> json) => StatusApprovalTemporaryMap(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? ledger;
    final String? finalStatus;

    Datum({
        this.ledger,
        this.finalStatus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        ledger: json["ledger"],
        finalStatus: json["final_status"],
    );

    Map<String, dynamic> toJson() => {
        "ledger": ledger,
        "final_status": finalStatus,
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
