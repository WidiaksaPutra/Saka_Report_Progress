// To parse this JSON data, do
//
//     final grafikKunjunganSnaModel = grafikKunjunganSnaModelFromJson(jsonString);

import 'dart:convert';

GrafikKunjunganSnaModel grafikKunjunganSnaModelFromJson(String str) => GrafikKunjunganSnaModel.fromJson(json.decode(str));

String grafikKunjunganSnaModelToJson(GrafikKunjunganSnaModel data) => json.encode(data.toJson());

class GrafikKunjunganSnaModel {
    final Meta? meta;
    final Data? data;

    GrafikKunjunganSnaModel({
        this.meta,
        this.data,
    });

    factory GrafikKunjunganSnaModel.fromJson(Map<String, dynamic> json) => GrafikKunjunganSnaModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data?.toJson(),
    };
}

class Data {
    final SuccessReportData? successReportData;
    final FailedReportData? failedReportData;
    final MissedReportData? missedReportData;
    final UpcomingReportData? upcomingReportData;

    Data({
        this.successReportData,
        this.failedReportData,
        this.missedReportData,
        this.upcomingReportData,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        successReportData: json["success_report_data"] == null ? null : SuccessReportData.fromJson(json["success_report_data"]),
        failedReportData: json["failed_report_data"] == null ? null : FailedReportData.fromJson(json["failed_report_data"]),
        missedReportData: json["missed_report_data"] == null ? null : MissedReportData.fromJson(json["missed_report_data"]),
        upcomingReportData: json["upcoming_report_data"] == null ? null : UpcomingReportData.fromJson(json["upcoming_report_data"]),
    );

    Map<String, dynamic> toJson() => {
        "success_report_data": successReportData?.toJson(),
        "failed_report_data": failedReportData?.toJson(),
        "missed_report_data": missedReportData?.toJson(),
        "upcoming_report_data": upcomingReportData?.toJson(),
    };
}

class FailedReportData {
    final int? plannedFailed;
    final int? additionalFailed;
    final int? replacementFailed;

    FailedReportData({
        this.plannedFailed,
        this.additionalFailed,
        this.replacementFailed,
    });

    factory FailedReportData.fromJson(Map<String, dynamic> json) => FailedReportData(
        plannedFailed: json["planned_failed"],
        additionalFailed: json["additional_failed"],
        replacementFailed: json["replacement_failed"],
    );

    Map<String, dynamic> toJson() => {
        "planned_failed": plannedFailed,
        "additional_failed": additionalFailed,
        "replacement_failed": replacementFailed,
    };
}

class MissedReportData {
    final int? plannedMissed;
    final int? additionalMissed;
    final int? replacementMissed;

    MissedReportData({
        this.plannedMissed,
        this.additionalMissed,
        this.replacementMissed,
    });

    factory MissedReportData.fromJson(Map<String, dynamic> json) => MissedReportData(
        plannedMissed: json["planned_missed"],
        additionalMissed: json["additional_missed"],
        replacementMissed: json["replacement_missed"],
    );

    Map<String, dynamic> toJson() => {
        "planned_missed": plannedMissed,
        "additional_missed": additionalMissed,
        "replacement_missed": replacementMissed,
    };
}

class SuccessReportData {
    final int? plannedSuccess;
    final int? additionalSuccess;
    final int? replacementSuccess;

    SuccessReportData({
        this.plannedSuccess,
        this.additionalSuccess,
        this.replacementSuccess,
    });

    factory SuccessReportData.fromJson(Map<String, dynamic> json) => SuccessReportData(
        plannedSuccess: json["planned_success"],
        additionalSuccess: json["additional_success"],
        replacementSuccess: json["replacement_success"],
    );

    Map<String, dynamic> toJson() => {
        "planned_success": plannedSuccess,
        "additional_success": additionalSuccess,
        "replacement_success": replacementSuccess,
    };
}

class UpcomingReportData {
    final int? plannedUpcoming;
    final int? additionalUpcoming;
    final int? replacementUpcoming;

    UpcomingReportData({
        this.plannedUpcoming,
        this.additionalUpcoming,
        this.replacementUpcoming,
    });

    factory UpcomingReportData.fromJson(Map<String, dynamic> json) => UpcomingReportData(
        plannedUpcoming: json["planned_upcoming"],
        additionalUpcoming: json["additional_upcoming"],
        replacementUpcoming: json["replacement_upcoming"],
    );

    Map<String, dynamic> toJson() => {
        "planned_upcoming": plannedUpcoming,
        "additional_upcoming": additionalUpcoming,
        "replacement_upcoming": replacementUpcoming,
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