// To parse this JSON data, do
//
//     final listSurveySnaModel = listSurveySnaModelFromJson(jsonString);

import 'dart:convert';

ListSurveySnaModel listSurveySnaModelFromJson(String str) => ListSurveySnaModel.fromJson(json.decode(str));

String listSurveySnaModelToJson(ListSurveySnaModel data) => json.encode(data.toJson());

class ListSurveySnaModel {
    final Meta? meta;
    final String? totalItems;
    final List<Datum>? data;

    ListSurveySnaModel({
        this.meta,
        this.totalItems,
        this.data,
    });

    factory ListSurveySnaModel.fromJson(Map<String, dynamic> json) => ListSurveySnaModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        totalItems: json["total_items"] == null ? '0' : json["total_items"].toString(),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "total_items": totalItems == null ? '0' : totalItems.toString(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? id;
    final String? type;
    final String? tglSurvey;
    final String? tglSurveyEst;
    final String? ledger;
    final String? namaToko;
    final String? alamatToko;
    final String? tipeSurvey;
    final String? captionSurvey;
    final String? keteranganPertama;
    final String? keteranganTambahan;
    final String? responToko;
    final String? createdAt;
    final String? docTypeFile1;
    final String? file1;
    final String? docTypeFile2;
    final String? file2;
    final String? docTypeFile3;
    final String? file3;
    final String? docTypeFile4;
    final String? file4;
    final String? docTypeFile5;
    final String? file5;
    final String? docTypeFile6;
    final String? file6;
    final String? docTypeFile7;
    final String? file7;
    final String? docTypeFile8;
    final String? file8;
    final String? docTypeFile9;
    final String? file9;

    Datum({
        this.id,
        this.type,
        this.tglSurvey,
        this.tglSurveyEst,
        this.ledger,
        this.namaToko,
        this.alamatToko,
        this.tipeSurvey,
        this.captionSurvey,
        this.keteranganPertama,
        this.keteranganTambahan,
        this.responToko,
        this.createdAt,
        this.docTypeFile1,
        this.file1,
        this.docTypeFile2,
        this.file2,
        this.docTypeFile3,
        this.file3,
        this.docTypeFile4,
        this.file4,
        this.docTypeFile5,
        this.file5,
        this.docTypeFile6,
        this.file6,
        this.docTypeFile7,
        this.file7,
        this.docTypeFile8,
        this.file8,
        this.docTypeFile9,
        this.file9,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? "" : json["id"].toString(),
        type: json["type"] == null ? "" : json["type"].toString(),
        tglSurvey: json["tgl_survey"] == null ? null : DateTime.parse(json["tgl_survey"]).toString(),
        tglSurveyEst: json["tgl_survey_est"] == null ? null : DateTime.parse(json["tgl_survey_est"]).toString(),
        ledger: json["ledger"] == null ? "" : json["ledger"].toString(),
        namaToko: json["nama_toko"] == null ? "" : json["nama_toko"].toString(),
        alamatToko: json["alamat_toko"] == null ? "" : json["alamat_toko"].toString(),
        tipeSurvey: json["tipe_survey"] == null ? "" : json["tipe_survey"].toString(),
        captionSurvey: json["caption_survey"] == null ? "" : json["caption_survey"].toString(),
        keteranganPertama: json["keterangan_pertama"] == null ? "" : json["keterangan_pertama"].toString(),
        keteranganTambahan: json["keterangan_tambahan"] == null ? "" : json["keterangan_tambahan"].toString(),
        responToko: json["respon_toko"] == null ? "" : json["respon_toko"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]).toString(),
        docTypeFile1: json["doc_type_file_1"] == null ? "" : json["doc_type_file_1"].toString(),
        file1: json["file_1"] == null ? "" : json["file_1"].toString(),
        docTypeFile2: json["doc_type_file_2"] == null ? "" : json["doc_type_file_2"].toString(),
        file2: json["file_2"] == null ? "" : json["file_2"].toString(),
        docTypeFile3: json["doc_type_file_3"] == null ? "" : json["doc_type_file_3"].toString(),
        file3: json["file_3"] == null ? "" : json["file_3"].toString(),
        docTypeFile4: json["doc_type_file_4"] == null ? "" : json["doc_type_file_4"].toString(),
        file4: json["file_4"] == null ? "" : json["file_4"].toString(),
        docTypeFile5: json["doc_type_file_5"] == null ? "" : json["doc_type_file_5"].toString(),
        file5: json["file_5"] == null ? "" : json["file_5"].toString(),
        docTypeFile6: json["doc_type_file_6"] == null ? "" : json["doc_type_file_6"].toString(),
        file6: json["file_6"] == null ? "" : json["file_6"].toString(),
        docTypeFile7: json["doc_type_file_7"] == null ? "" : json["doc_type_file_7"].toString(),
        file7: json["file_7"] == null ? "" : json["file_7"].toString(),
        docTypeFile8: json["doc_type_file_8"] == null ? "" : json["doc_type_file_8"].toString(),
        file8: json["file_8"] == null ? "" : json["file_8"].toString(),
        docTypeFile9: json["doc_type_file_9"] == null ? "" : json["doc_type_file_9"].toString(),
        file9: json["file_9"] == null ? "" : json["file_9"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": (id == null) ? "" : id.toString(),
        "type": (type == null) ? "" : type.toString(),
        "tgl_survey": (tglSurvey == null) ? null : tglSurvey.toString(),
        "tgl_survey_est": (tglSurveyEst == null) ? null : tglSurveyEst.toString(),
        "ledger": (ledger == null) ? "" : ledger.toString(),
        "nama_toko": (namaToko == null) ? "" : namaToko.toString(),
        "alamat_toko": (alamatToko == null) ? "" : alamatToko.toString(),
        "tipe_survey": (tipeSurvey == null) ? "" : tipeSurvey.toString(),
        "caption_survey": (captionSurvey == null) ? "" : captionSurvey.toString(),
        "keterangan_pertama": (keteranganPertama == null) ? "" : keteranganPertama.toString(),
        "keterangan_tambahan": (keteranganTambahan == null) ? "" : keteranganTambahan.toString(),
        "respon_toko": (responToko == null) ? "" : responToko.toString(),
        "created_at": (createdAt == null) ? null : createdAt.toString(),
        "doc_type_file_1": (docTypeFile1 == null) ? "" : docTypeFile1.toString(),
        "file_1": (file1 == null) ? "" : file1.toString(),
        "doc_type_file_2": (docTypeFile2 == null) ? "" : docTypeFile2.toString(),
        "file_2": (file2 == null) ? "" : file2.toString(),
        "doc_type_file_3": (docTypeFile3 == null) ? "" : docTypeFile3.toString(),
        "file_3": (file3 == null) ? "" : file3.toString(),
        "doc_type_file_4": (docTypeFile4 == null) ? "" : docTypeFile4.toString(),
        "file_4": (file4 == null) ? "" : file4.toString(),
        "doc_type_file_5": (docTypeFile5 == null) ? "" : docTypeFile5.toString(),
        "file_5": (file5 == null) ? "" : file5.toString(),
        "doc_type_file_6": (docTypeFile6 == null) ? "" : docTypeFile6.toString(),
        "file_6": (file6 == null) ? "" : file6.toString(),
        "doc_type_file_7": (docTypeFile7 == null) ? "" : docTypeFile7.toString(),
        "file_7": (file7 == null) ? "" : file7.toString(),
        "doc_type_file_8": (docTypeFile8 == null) ? "" : docTypeFile8.toString(),
        "file_8": (file8 == null) ? "" : file8.toString(),
        "doc_type_file_9": (docTypeFile9 == null) ? "" : docTypeFile9.toString(),
        "file_9": (file9 == null) ? "" : file9.toString(),
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