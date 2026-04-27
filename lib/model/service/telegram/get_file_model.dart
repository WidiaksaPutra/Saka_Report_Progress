// To parse this JSON data, do
//
//     final getFileModel = getFileModelFromJson(jsonString);
import 'dart:convert';

GetFileModel getFileModelFromJson(String str) => GetFileModel.fromJson(json.decode(str));

String getFileModelToJson(GetFileModel data) => json.encode(data.toJson());

class GetFileModel {
    final bool? ok;
    final Result? result;

    GetFileModel({
        this.ok,
        this.result,
    });

    factory GetFileModel.fromJson(Map<String, dynamic> json) => GetFileModel(
        ok: json["ok"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "result": result?.toJson(),
    };
}

class Result {
    final String? fileId;
    final String? fileUniqueId;
    final int? fileSize;
    final String? filePath;

    Result({
        this.fileId,
        this.fileUniqueId,
        this.fileSize,
        this.filePath,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        fileId: json["file_id"],
        fileUniqueId: json["file_unique_id"],
        fileSize: json["file_size"],
        filePath: json["file_path"],
    );

    Map<String, dynamic> toJson() => {
        "file_id": fileId,
        "file_unique_id": fileUniqueId,
        "file_size": fileSize,
        "file_path": filePath,
    };
}