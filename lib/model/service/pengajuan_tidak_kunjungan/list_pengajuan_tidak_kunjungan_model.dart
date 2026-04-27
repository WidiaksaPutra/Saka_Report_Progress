// To parse this JSON data, do
//
//     final listPengajuanTidakKunjunganModel = listPengajuanTidakKunjunganModelFromJson(jsonString);

import 'dart:convert';


ListPengajuanTidakKunjunganModel listPengajuanTidakKunjunganModelFromJson(String str) => ListPengajuanTidakKunjunganModel.fromJson(json.decode(str));

String listPengajuanTidakKunjunganModelToJson(ListPengajuanTidakKunjunganModel data) => json.encode(data.toJson());

class ListPengajuanTidakKunjunganModel {
    final List<Datum> data;
    final dynamic nextStart;
    final int total;
     
    ListPengajuanTidakKunjunganModel({
        required this.data,
        required this.nextStart,
        required this.total,
    });

    factory ListPengajuanTidakKunjunganModel.fromJson(Map<String, dynamic> json) => ListPengajuanTidakKunjunganModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        nextStart: json["next_start"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "next_start": nextStart,
        "total": total,
    };
}

class Datum {
    final DateTime? startDate;
    final DateTime? endDate;
    final DateTime? startOffDate;
    final DateTime? endOffDate;
    final DateTime? startCreatedDate;
    final DateTime? endCreatedDate;
    final String? day;
    final String? reason;
    final String? username;
    final String? offType;
    final String? groupCode;
    final String? office;
    final String? approveStatus;

    Datum({
        required this.startDate,
        required this.endDate,
        required this.startOffDate,
        required this.endOffDate,
        required this.startCreatedDate,
        required this.endCreatedDate,
        required this.day,
        required this.reason,
        required this.username,
        required this.offType,
        required this.groupCode,
        required this.office,
        required this.approveStatus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        startDate: json["start_date"] == null ? DateTime.now() : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? DateTime.now() : DateTime.parse(json["end_date"]),
        startOffDate: json["start_off_date"] == null ? DateTime.now() : DateTime.parse(json["start_off_date"]),
        endOffDate: json["end_off_date"] == null ? DateTime.now() : DateTime.parse(json["end_off_date"]),
        startCreatedDate: json["start_created_date"] == null ? DateTime.now() : DateTime.parse(json["start_created_date"]),
        endCreatedDate: json["end_created_date"] == null ? DateTime.now() : DateTime.parse(json["end_created_date"]),
        day: (json["day"] == null) ? "0" : json["day"].toString(),
        reason: (json["reason"] == null) ? "-" : json["reason"].toString(),
        username: (json["username"] == null) ? "-" : json["username"].toString(),
        offType: (json["off_type"] == null) ? "3" : json["off_type"].toString(),
        groupCode: (json["group_code"] == null) ? "-" : json["group_code"].toString(),
        office: (json["office"] == null) ? "-" : json["office"].toString(),
        approveStatus: (json["approve_status"] == null) ? "0 " : json["approve_status"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "start_date": (startDate == null) ? DateTime.now() : startDate!.toIso8601String(),
        "end_date": (endDate == null) ? DateTime.now() : endDate!.toIso8601String(),
        "start_off_date": (startOffDate == null) ? DateTime.now() : "${startOffDate!.year.toString().padLeft(4, '0')}-${startOffDate!.month.toString().padLeft(2, '0')}-${startOffDate!.day.toString().padLeft(2, '0')}",
        "end_off_date": (endOffDate == null) ? DateTime.now() : "${endOffDate!.year.toString().padLeft(4, '0')}-${endOffDate!.month.toString().padLeft(2, '0')}-${endOffDate!.day.toString().padLeft(2, '0')}",
        "start_created_date": (startCreatedDate == null) ? DateTime.now() : startCreatedDate?.toIso8601String(),
        "end_created_date":(endCreatedDate == null) ? DateTime.now() : endCreatedDate?.toIso8601String(),
        "day": (day == null) ? "0" : day.toString() ,
        "reason": (reason == null) ? "-" : reason.toString(),
        "username": (username == null) ? "-" : username.toString(),
        "off_type": (offType == null) ? "3" : offType.toString(),
        "group_code": (groupCode == null) ? "-" : groupCode.toString() ,
        "office": (office == null) ? "-" : office.toString(),
        "approve_status": (approveStatus == null) ? "0 " : approveStatus.toString(),
    };
}