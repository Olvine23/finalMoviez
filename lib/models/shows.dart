// To parse this JSON data, do
//
//     final mod = modFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Mod> modFromJson(String str) =>
    List<Mod>.from(json.decode(str).map((x) => Mod.fromJson(x)));

String modToJson(List<Mod> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mod {
  Mod({
    required this.id,
    required this.url,
    required this.name,
    required this.language,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.officialSite,
    required this.rating,
    required this.image,
    required this.summary,
  });

  dynamic id;
  dynamic url;
  dynamic name;
  dynamic language;
  dynamic status;
  dynamic runtime;
  dynamic averageRuntime;
  dynamic officialSite;
  Rating? rating;
  Images? image;
  dynamic summary;

  factory Mod.fromJson(Map<String, dynamic> json) => Mod(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        language: json["language"],
        status: json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        officialSite: json["officialSite"],
        rating: json["rating"] != null ? Rating.fromJson(json["rating"]) : null,
        image: json["image"] != null ? Images.fromJson(json["image"]) : null,
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "language": language,
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "officialSite": officialSite,
        "rating": rating!.toJson(),
        "image": image!.toJson(),
        "summary": summary,
      };
}

class Images {
  Images({
    required this.medium,
    required this.original,
  });

  String medium;
  String original;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

class Rating {
  Rating({
    required this.average,
  });

  dynamic average;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"] != null ? json["average"].toDouble() : null,
      );

  Map<String, dynamic> toJson() => {
        "average": average,
      };
}
