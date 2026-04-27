// To parse this JSON data, do
//
//     final dropdownStoreGagalKunjunganSnaModel = dropdownStoreGagalKunjunganSnaModelFromJson(jsonString);

import 'dart:convert';

DropdownStoreGagalKunjunganSnaModel dropdownStoreGagalKunjunganSnaModelFromJson(String str) => DropdownStoreGagalKunjunganSnaModel.fromJson(json.decode(str));

String dropdownStoreGagalKunjunganSnaModelToJson(DropdownStoreGagalKunjunganSnaModel data) => json.encode(data.toJson());

class DropdownStoreGagalKunjunganSnaModel {
    final Meta meta;
    final List<Datum> data;

    DropdownStoreGagalKunjunganSnaModel({
        required this.meta,
        required this.data,
    });

    factory DropdownStoreGagalKunjunganSnaModel.fromJson(Map<String, dynamic> json) => DropdownStoreGagalKunjunganSnaModel(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final DateTime reportDate;
    final String ledger;
    final String storeName;

    Datum({
        required this.reportDate,
        required this.ledger,
        required this.storeName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        reportDate: DateTime.parse(json["report_date"]),
        ledger: json["ledger"],
        storeName: json["store_name"],
    );

    Map<String, dynamic> toJson() => {
        "report_date": "${reportDate.year.toString().padLeft(4, '0')}-${reportDate.month.toString().padLeft(2, '0')}-${reportDate.day.toString().padLeft(2, '0')}",
        "ledger": ledger,
        "store_name": storeName,
    };
}

class Meta {
    final int code;
    final String status;
    final String message;

    Meta({
        required this.code,
        required this.status,
        required this.message,
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
