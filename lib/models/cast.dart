// // To parse this JSON data, do
// //
// //     final cast = castFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<Cast> castFromJson(String str) => List<Cast>.from(json.decode(str).map((x) => Cast.fromJson(x)));

// String castToJson(List<Cast> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Cast {
//     Cast({
//         required this.person,
//         required this.self,
//     });

//     Person person;
//     bool self;

//     factory Cast.fromJson(Map<String, dynamic> json) => Cast(
//         person: Person.fromJson(json["person"]),
//         self: json["self"],
//     );

//     Map<String, dynamic> toJson() => {
//         "person": person.toJson(),
//         "self": self,
//     };
// }

// class Person {
//     Person({
//         required this.id,
//         required this.url,
//         required this.name,
//         required this.country,
//         required this.birthday,
//         required this.deathday,
//         required this.gender,
//         required this.image,
//         required this.updated,
//         required this.links,
//     });

//     int id;
//     String url;
//     String name;
//     Country country;
//     DateTime birthday;
//     dynamic deathday;
//     String gender;
//     Image image;
//     int updated;
//     Links links;

//     factory Person.fromJson(Map<String, dynamic> json) => Person(
//         id: json["id"],
//         url: json["url"],
//         name: json["name"],
//         country: Country.fromJson(json["country"]),
//         birthday: DateTime.parse(json["birthday"]),
//         deathday: json["deathday"],
//         gender: json["gender"],
//         image: Image.fromJson(json["image"]),
//         updated: json["updated"],
//         links: Links.fromJson(json["_links"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//         "name": name,
//         "country": country.toJson(),
//         "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
//         "deathday": deathday,
//         "gender": gender,
//         "image": image.toJson(),
//         "updated": updated,
//         "_links": links.toJson(),
//     };
// }

// class Country {
//     Country({
//         required this.name,
//         required this.code,
//         required this.timezone,
//     });

//     String name;
//     String code;
//     String timezone;

//     factory Country.fromJson(Map<String, dynamic> json) => Country(
//         name: json["name"],
//         code: json["code"],
//         timezone: json["timezone"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "code": code,
//         "timezone": timezone,
//     };
// }

// class Image {
//     Image({
//         required this.medium,
//         required this.original,
//     });

//     String medium;
//     String original;

//     factory Image.fromJson(Map<String, dynamic> json) => Image(
//         medium: json["medium"],
//         original: json["original"],
//     );

//     Map<String, dynamic> toJson() => {
//         "medium": medium,
//         "original": original,
//     };
// }

// class Links {
//     Links({
//         required this.self,
//     });

//     Self self;

//     factory Links.fromJson(Map<String, dynamic> json) => Links(
//         self: Self.fromJson(json["self"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "self": self.toJson(),
//     };
// }

// class Self {
//     Self({
//         required this.href,
//     });

//     String href;

//     factory Self.fromJson(Map<String, dynamic> json) => Self(
//         href: json["href"],
//     );

//     Map<String, dynamic> toJson() => {
//         "href": href,
//     };
// }
