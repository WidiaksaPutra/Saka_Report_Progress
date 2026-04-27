// To parse this JSON data, do
//
//     final listPengajuanTambahKunjunganModel = listPengajuanTambahKunjunganModelFromJson(jsonString);

import 'dart:convert';


ListPengajuanTambahKunjunganModel listPengajuanTambahKunjunganModelFromJson(String str) => ListPengajuanTambahKunjunganModel.fromJson(json.decode(str));

String listPengajuanTambahKunjunganModelToJson(ListPengajuanTambahKunjunganModel data) => json.encode(data.toJson());

class ListPengajuanTambahKunjunganModel {
    final Meta? meta;
    final List<Datum>? data;
    final dynamic nextStart;
    final int? total;

    ListPengajuanTambahKunjunganModel({
        this.meta,
        this.data,
        this.nextStart,
        this.total,
    });

    factory ListPengajuanTambahKunjunganModel.fromJson(Map<String, dynamic> json) => ListPengajuanTambahKunjunganModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        nextStart: json["next_start"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "next_start": nextStart,
        "total": total,
    };
}

class Datum {
    final String? id;
    final String? requestId;
    final String? additionalDate;
    final String? createdAt;
    final String? additionalLedger;
    final String? status;
    final String? approveBy;
    final String? approveDate;
    final String? cabang;
    final String? area;
    final String? type;
    final String? reason;
    final String? no;

    Datum({
        this.id,
        this.requestId,
        this.additionalDate,
        this.createdAt,
        this.additionalLedger,
        this.status,
        this.approveBy,
        this.approveDate,
        this.cabang,
        this.area,
        this.type,
        this.reason,
        this.no,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: (json["id"] == null) ? "-" : json["id"].toString(),
        requestId: (json["request_id"] == null) ? "-" : json["request_id"].toString(),
        additionalDate: (json["additional_date"] == null) ? DateTime.now.toString() : DateTime.parse(json["additional_date"]).toString(),
        createdAt: (json["created_at"] == null) ? DateTime.now.toString() : DateTime.parse(json["created_at"]).toString(),
        additionalLedger: (json["additional_ledger"] == null) ? "-" : json["additional_ledger"].toString(),
        status: (json["status"] == null) ? "-" : json["status"].toString(),
        approveBy: (json["approve_by"] == null) ? "-" : json["approve_by"].toString(),
        approveDate: (json["approve_date"] == null) ? DateTime.now.toString() : json["approve_date"].toString(),
        cabang: (json["cabang"] == null) ? "-" : json["cabang"].toString(),
        area: (json["area"] == null) ? "-" : json["area"].toString(),
        type: (json["type"] == null) ? "-" : json["type"].toString(),
        reason: (json["reason"] == null) ? "-" : json["reason"].toString(),
        no: (json["no"] == null) ? "-" : json["no"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": (id == null) ? "-" : id.toString(),
        "request_id": (requestId == null) ? "-" : requestId.toString(),
        "additional_date": (additionalDate == null) ? DateTime.now.toString() : additionalDate.toString(),
        "created_at": (createdAt == null) ? DateTime.now.toString() : createdAt?.toString(),
        "additional_ledger": (additionalLedger == null) ? "-" : additionalLedger.toString(),
        "status": (status == null) ? "-" : status.toString(),
        "approve_by": (approveBy == null) ? "-" : approveBy.toString(),
        "approve_date": (approveDate == null) ? DateTime.now.toString() : approveDate.toString(),
        "cabang": (cabang == null) ? "-" : cabang.toString(),
        "area": (area == null) ? "-" : area.toString(),
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