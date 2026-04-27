import 'dart:convert';

MapsLocationModel mapsLocationModelFromJson(String str) => MapsLocationModel.fromJson(json.decode(str));

String mapsLocationModelToJson(MapsLocationModel data) => json.encode(data.toJson());

class MapsLocationModel {
    final List<Result>? results;
    final String? status;

    MapsLocationModel({
        this.results,
        this.status,
    });

    factory MapsLocationModel.fromJson(Map<String, dynamic> json) => MapsLocationModel(
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "status": status,
    };
}

class Result {
    final String? businessStatus;
    final String? formattedAddress;
    final Geometry? geometry;
    final String? icon;
    final String? iconBackgroundColor;
    final String? iconMaskBaseUri;
    final String? name;
    final OpeningHours? openingHours;
    final List<Photo>? photos;
    final String? placeId;
    final double? rating;
    final String? reference;
    final List<String>? types;
    final int? userRatingsTotal;

    Result({
        this.businessStatus,
        this.formattedAddress,
        this.geometry,
        this.icon,
        this.iconBackgroundColor,
        this.iconMaskBaseUri,
        this.name,
        this.openingHours,
        this.photos,
        this.placeId,
        this.rating,
        this.reference,
        this.types,
        this.userRatingsTotal,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        businessStatus: json["business_status"],
        formattedAddress: json["formatted_address"],
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        icon: json["icon"],
        iconBackgroundColor: json["icon_background_color"],
        iconMaskBaseUri: json["icon_mask_base_uri"],
        name: json["name"],
        openingHours: json["opening_hours"] == null ? null : OpeningHours.fromJson(json["opening_hours"]),
        photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
        placeId: json["place_id"],
        rating: json["rating"]?.toDouble(),
        reference: json["reference"],
        types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
        userRatingsTotal: json["user_ratings_total"],
    );

    Map<String, dynamic> toJson() => {
        "business_status": businessStatus,
        "formatted_address": formattedAddress,
        "geometry": geometry?.toJson(),
        "icon": icon,
        "icon_background_color": iconBackgroundColor,
        "icon_mask_base_uri": iconMaskBaseUri,
        "name": name,
        "opening_hours": openingHours?.toJson(),
        "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x.toJson())),
        "place_id": placeId,
        "rating": rating,
        "reference": reference,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
        "user_ratings_total": userRatingsTotal,
    };
}

class Geometry {
    final Location? location;
    final Viewport? viewport;

    Geometry({
        this.location,
        this.viewport,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        viewport: json["viewport"] == null ? null : Viewport.fromJson(json["viewport"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "viewport": viewport?.toJson(),
    };
}

class Location {
    final double? lat;
    final double? lng;

    Location({
        this.lat,
        this.lng,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Viewport {
    final Location? northeast;
    final Location? southwest;

    Viewport({
        this.northeast,
        this.southwest,
    });

    factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: json["northeast"] == null ? null : Location.fromJson(json["northeast"]),
        southwest: json["southwest"] == null ? null : Location.fromJson(json["southwest"]),
    );

    Map<String, dynamic> toJson() => {
        "northeast": northeast?.toJson(),
        "southwest": southwest?.toJson(),
    };
}

class OpeningHours {
    final bool? openNow;

    OpeningHours({
        this.openNow,
    });

    factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        openNow: json["open_now"],
    );

    Map<String, dynamic> toJson() => {
        "open_now": openNow,
    };
}

class Photo {
    final int? height;
    final List<String>? htmlAttributions;
    final String? photoReference;
    final int? width;

    Photo({
        this.height,
        this.htmlAttributions,
        this.photoReference,
        this.width,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"],
        htmlAttributions: json["html_attributions"] == null ? [] : List<String>.from(json["html_attributions"]!.map((x) => x)),
        photoReference: json["photo_reference"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "html_attributions": htmlAttributions == null ? [] : List<dynamic>.from(htmlAttributions!.map((x) => x)),
        "photo_reference": photoReference,
        "width": width,
    };
}