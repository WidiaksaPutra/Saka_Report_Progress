import 'dart:convert';

DropdownAlamatModel dropdownProvinsiModelFromJson(String str) => DropdownAlamatModel.fromJson(json.decode(str));

String dropdownProvinsiModelToJson(DropdownAlamatModel data) => json.encode(data.toJson());

class DropdownAlamatModel {
    final int? status;
    final String? message;
    final List<Result>? result;

    DropdownAlamatModel({
        this.status,
        this.message,
        this.result,
    });

    factory DropdownAlamatModel.fromJson(Map<String, dynamic> json) => DropdownAlamatModel(
        status: json["status"],
        message: json["message"],
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    final String? id;
    final String? text;

    Result({
        this.id,
        this.text,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? '0' : json["id"].toString(),
        text: json["text"] == null ? '' : json["text"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? '0' : id.toString(),
        "text": text == null ? '' : text.toString(),
    };
}