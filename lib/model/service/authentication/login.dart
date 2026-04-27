// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    final Meta? meta;
    final Data? data;

    LoginModel({
        this.meta,
        this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data?.toJson(),
    };
}

class Data {
    final String? token;
    final List<String>? endpointPermissions;

    Data({
        this.token,
        this.endpointPermissions,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] == null ? "" : json["token"].toString(),
        endpointPermissions: json["endpoint_permissions"] == null ? [] : List<String>.from(json["endpoint_permissions"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "token": token == null ? "" : token.toString(),
        "endpoint_permissions": endpointPermissions == null ? [] : List<dynamic>.from(endpointPermissions!.map((x) => x)),
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