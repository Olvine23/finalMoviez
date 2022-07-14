// To parse this JSON data, do
//
//     final pics = picsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
import 'dart:math';

List<Pics> picsFromJson(String str) => List<Pics>.from(json.decode(str).map((x) => Pics.fromJson(x)));

String picsToJson(List<Pics> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pics {
    Pics({
        required this.id,
        required this.type,
        required this.main,
        required this.resolutions,
    });

    int id;
    Type? type;
    bool main;
    Resolutions resolutions;

    factory Pics.fromJson(Map<String, dynamic> json) => Pics(
        id: json["id"],
        type: typeValues.map[json["type"]],
        main: json["main"],
        resolutions: Resolutions.fromJson(json["resolutions"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "main": main,
        "resolutions": resolutions.toJson(),
    };
}

class Resolutions {
    Resolutions({
        required this.original,
        required this.medium,
    });

    Original original;
    Original? medium;

    factory Resolutions.fromJson(Map<String, dynamic> json) => Resolutions(
        original: Original.fromJson(json["original"]),
        medium: json["medium"] == null ? null : Original.fromJson(json["medium"]),
    );

    Map<String, dynamic> toJson() => {
        "original": original.toJson(),
        // ignore: prefer_null_aware_operators
        "medium": medium == null ? null : medium!.toJson(),
    };
}

class Original {
    Original({
        required this.url,
        required this.width,
        required this.height,
    });

    dynamic url;
    int width;
    int height;

    factory Original.fromJson(Map<String, dynamic> json) => Original(
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
    };
}

enum Type { POSTER, BACKGROUND, BANNER }

final typeValues = EnumValues({
    "background": Type.BACKGROUND,
    "banner": Type.BANNER,
    "poster": Type.POSTER
});

class EnumValues<T> {
    Map<String, T> map;
  late  Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
