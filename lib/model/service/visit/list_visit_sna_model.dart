// To parse this JSON data, do
//
//     final listReportSnaModel = listReportSnaModelFromJson(jsonString);

import 'dart:convert';

ListReportSnaModel listReportSnaModelFromJson(String str) => ListReportSnaModel.fromJson(json.decode(str));

String listReportSnaModelToJson(ListReportSnaModel data) => json.encode(data.toJson());

class ListReportSnaModel {
    final Meta? meta;
    final String? totalItems;
    final List<Datum>? data;

    ListReportSnaModel({
        this.meta,
        this.totalItems,
        this.data,
    });

    factory ListReportSnaModel.fromJson(Map<String, dynamic> json) => ListReportSnaModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        totalItems: (json["total_items"] == null) ? '0' : json["total_items"].toString(),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "total_items": (totalItems == null) ? '0' : totalItems.toString(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? type;
    final String? id;
    final String? tglKunjungan;
    final String? tglKunjunganEst;
    final String? ledger;
    final String? namaToko;
    final String? alamatToko;
    final String? tipeKunjungan;
    final String? captionKunjungan;
    final String? keteranganPertama;
    final String? keteranganTambahan;
    final String? responToko;
    final String? createdAt;
    final String? file1;
    final String? file2;
    final String? file3;
    final String? file4;
    final String? file5;
    final String? file6;
    final String? file7;
    final String? file8;
    final String? file9;

    Datum({
        this.type,
        this.id,
        this.tglKunjungan,
        this.tglKunjunganEst,
        this.ledger,
        this.namaToko,
        this.alamatToko,
        this.tipeKunjungan,
        this.captionKunjungan,
        this.keteranganPertama,
        this.keteranganTambahan,
        this.responToko,
        this.createdAt,
        this.file1,
        this.file2,
        this.file3,
        this.file4,
        this.file5,
        this.file6,
        this.file7,
        this.file8,
        this.file9,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: (json["type"] == null) ? '' : json["type"].toString(),
        id: (json["id"] == null) ? '' : json["id"].toString(),
        tglKunjungan: (json["tgl_kunjungan"] == null) ? null : DateTime.parse(json["tgl_kunjungan"]).toString(),
        tglKunjunganEst: (json["tgl_kunjungan_est"] == null) ? null : DateTime.parse(json["tgl_kunjungan_est"]).toString(),
        ledger: (json["ledger"] == null) ? '' : json["ledger"].toString(),
        namaToko: (json["nama_toko"] == null) ? '' : json["nama_toko"].toString(),
        alamatToko: (json["alamat_toko"] == null) ? '' : json["alamat_toko"].toString(),
        tipeKunjungan: (json["tipe_kunjungan"] == null) ? '' : json["tipe_kunjungan"].toString(),
        captionKunjungan: (json["caption_kunjungan"] == null) ? '' : json["caption_kunjungan"].toString(),
        keteranganPertama: (json["keterangan_pertama"] == null) ? '' : json["keterangan_pertama"].toString(),
        keteranganTambahan: (json["keterangan_tambahan"] == null) ? '' : json["keterangan_tambahan"].toString(),
        responToko: (json["respon_toko"] == null) ? '' : json["respon_toko"].toString(),
        createdAt: (json["created_at"] == null) ? null : DateTime.parse(json["created_at"]).toString(),
        file1: json["file_1"] == null ? '' : json["file_1"].toString(),
        file2: json["file_2"] == null ? '' : json["file_2"].toString(),
        file3: json["file_3"] == null ? '' : json["file_3"].toString(),
        file4: json["file_4"] == null ? '' : json["file_4"].toString(),
        file5: json["file_5"] == null ? '' : json["file_5"].toString(),
        file6: json["file_6"] == null ? '' : json["file_6"].toString(),
        file7: json["file_7"] == null ? '' : json["file_7"].toString(),
        file8: json["file_8"] == null ? '' : json["file_8"].toString(),
        file9: json["file_9"] == null ? '' : json["file_9"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "type": (type == null) ? '' : type.toString(),
        "id": (id == null) ? '' : id.toString(),
        "tgl_kunjungan": (tglKunjungan == null) ? null : tglKunjungan.toString(),
        "tgl_kunjungan_est": (tglKunjunganEst == null) ? null : tglKunjunganEst.toString(),
        "ledger": (ledger == null) ? '' : ledger.toString(),
        "nama_toko": (namaToko == null) ? '' : namaToko.toString(),
        "alamat_toko": (alamatToko == null) ? '' : alamatToko.toString(),
        "tipe_kunjungan": (tipeKunjungan == null) ? '' : tipeKunjungan.toString(),
        "caption_kunjungan": (captionKunjungan == null) ? '' : captionKunjungan.toString(),
        "keterangan_pertama": (keteranganPertama == null) ? '' : keteranganPertama.toString(),
        "keterangan_tambahan": (keteranganTambahan == null) ? '' : keteranganTambahan.toString(),
        "respon_toko": (responToko == null) ? '' : responToko.toString(),
        "created_at": (createdAt == null) ? null : createdAt.toString(),
        "file_1": (file1 == null) ? '' : file1.toString(),
        "file_2": (file2 == null) ? '' : file2.toString(),
        "file_3": (file3 == null) ? '' : file3.toString(),
        "file_4": (file4 == null) ? '' : file4.toString(),
        "file_5": (file5 == null) ? '' : file5.toString(),
        "file_6": (file6 == null) ? '' : file6.toString(),
        "file_7": (file7 == null) ? '' : file7.toString(),
        "file_8": (file8 == null) ? '' : file8.toString(),
        "file_9": (file9 == null) ? '' : file9.toString(),
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