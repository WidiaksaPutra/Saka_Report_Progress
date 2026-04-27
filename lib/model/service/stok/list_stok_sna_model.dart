// To parse this JSON data, do
//
//     final listStokSnaModel = listStokSnaModelFromJson(jsonString);

import 'dart:convert';

ListStokSnaModel listStokSnaModelFromJson(String str) => ListStokSnaModel.fromJson(json.decode(str));

String listStokSnaModelToJson(ListStokSnaModel data) => json.encode(data.toJson());

class ListStokSnaModel {
    final Meta? meta;
    final int? totalItems;
    final List<Datum>? data;

    ListStokSnaModel({
        this.meta,
        this.totalItems,
        this.data,
    });

    factory ListStokSnaModel.fromJson(Map<String, dynamic> json) => ListStokSnaModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        totalItems: json["total_items"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "total_items": totalItems,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? area;
    final String? itemCode;
    final String? itemName;
    final String? sellUom;
    final String? hargaAmbil;
    final String? hargaKirim;
    final String? saldoAkhir;

    Datum({
        this.area,
        this.itemCode,
        this.itemName,
        this.sellUom,
        this.hargaAmbil,
        this.hargaKirim,
        this.saldoAkhir,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        area: (json["area"] == null) ? '' : json["area"].toString(),
        itemCode: (json["item_code"] == null) ? '' : json["item_code"].toString(),
        itemName: (json["item_name"] == null) ? '' : json["item_name"].toString(),
        sellUom: (json["sell_uom"] == null) ? '' : json["sell_uom"].toString(),
        hargaAmbil: (json["harga_ambil"] == null) ? '0' : json["harga_ambil"].toString(),
        hargaKirim: (json["harga_kirim"] == null) ? '0' : json["harga_kirim"].toString() ,
        saldoAkhir: (json["saldo_akhir"] == null) ? '0' : json["saldo_akhir"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "area": area == null ? '' : area.toString(),
        "item_code": itemCode == null ? '' : itemCode.toString(),
        "item_name": itemName == null ? '' : itemName.toString(),
        "sell_uom": sellUom == null ? '' : sellUom.toString(),
        "harga_ambil": hargaAmbil == null ? '0' : hargaAmbil.toString(),
        "harga_kirim": hargaKirim == null ? '0' : hargaKirim.toString(),
        "saldo_akhir": saldoAkhir == null ? '0' : saldoAkhir.toString(),
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