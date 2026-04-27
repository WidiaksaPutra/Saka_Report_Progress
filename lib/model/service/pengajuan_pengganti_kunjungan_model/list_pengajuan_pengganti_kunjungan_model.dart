// To parse this JSON data, do
//
//     final listPengajuanPenggantiKunjunganModel = listPengajuanPenggantiKunjunganModelFromJson(jsonString);

import 'dart:convert';

ListPengajuanPenggantiKunjunganModel listPengajuanPenggantiKunjunganModelFromJson(String str) => ListPengajuanPenggantiKunjunganModel.fromJson(json.decode(str));

String listPengajuanPenggantiKunjunganModelToJson(ListPengajuanPenggantiKunjunganModel data) => json.encode(data.toJson());

class ListPengajuanPenggantiKunjunganModel {
    final Meta? meta;
    final List<Datum>? data;
    final int? total;

    ListPengajuanPenggantiKunjunganModel({
        this.meta,
        this.data,
        this.total,
    });

    factory ListPengajuanPenggantiKunjunganModel.fromJson(Map<String, dynamic> json) => ListPengajuanPenggantiKunjunganModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        total: (json["total"] == null) ? 0 : json["total"],
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": (total == null) ? 0 : total,
    };
}

class Datum {
    final String? id;
    final String? ledgerBefore;
    final String? ledgerAfter;
    final String? dateBefore;
    final String? dateAfter;
    final String? createdAt;
    final String? status;
    final String? approveBy;
    final String? approveDate;
    final String? cabang;
    final String? area;
    final String? requestId;
    final String? type;
    final String? reason;
    final String? no;

    Datum({
      this.id,
      this.ledgerBefore,
      this.ledgerAfter,
      this.dateBefore,
      this.dateAfter,
      this.createdAt,
      this.status,
      this.approveBy,
      this.approveDate,
      this.cabang,
      this.area,
      this.requestId,
      this.type,
      this.reason,
      this.no,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: (json["id"] == null) ? "-" : json["id"].toString(),
        ledgerBefore: (json["ledger_before"] == null) ? "-" : json["ledger_before"].toString(),
        ledgerAfter: (json["ledger_after"] == null) ? "-" : json["ledger_after"].toString(),
        dateBefore: (json["date_before"] == null) ? DateTime.now.toString() : DateTime.parse(json["date_before"]).toString(),
        dateAfter: (json["date_after"] == null) ? DateTime.now.toString() : DateTime.parse(json["date_after"]).toString(),
        createdAt: (json["created_at"] == null) ? DateTime.now.toString() : DateTime.parse(json["created_at"]).toString(),
        status: (json["status"] == null) ? "null" : json["status"].toString(),
        approveBy: (json["approve_by"] == null) ? "-" : json["approve_by"].toString(),
        approveDate: (json["approve_date"] == null) ? "-" : json["approve_date"].toString(),
        cabang: (json["cabang"] == null) ? "-" : json["cabang"].toString(),
        area: (json["area"] == null) ? "-" : json["area"].toString(),
        requestId: (json["request_id"] == null) ? "-" : json["request_id"].toString(),
        type: (json["type"] == null) ? "-" : json["type"].toString(),
        reason: (json["reason"] == null) ? "-" : json["reason"].toString(),
        no: (json["no"] == null) ? "-" : json["no"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": (id == null) ? "0" : id.toString(),
        "ledger_before": (ledgerBefore == null) ? "-" : ledgerBefore.toString(),
        "ledger_after": (ledgerAfter == null) ? "-" : ledgerAfter.toString(),
        "date_before": (dateBefore == null) ? DateTime.now.toString() : dateBefore.toString(),
        "date_after": (dateAfter == null) ? DateTime.now.toString() : dateAfter.toString(),
        "created_at": (createdAt == null) ? DateTime.now.toString() : createdAt.toString(),
        "status": (status == null) ? "null" : status.toString(),
        "approve_by": (approveBy == null) ? "-" : approveBy.toString(),
        "approve_date": (approveDate == null) ? "-" : approveDate.toString(),
        "cabang": (cabang == null) ? "-" : cabang.toString(),
        "area": (area == null) ? "-" : area.toString(),
        "request_id": (requestId == null) ? "-" : requestId.toString(),
        "type": (type == null) ? "-" : type.toString(),
        "reason": (reason == null) ? "-" : reason.toString(),
        "no": (no == null) ? "-" : no.toString(),
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