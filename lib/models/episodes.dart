// To parse this JSON data, do
//
//     final cast = castFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Cast> castFromJson(String str) => List<Cast>.from(json.decode(str).map((x) => Cast.fromJson(x)));

String castToJson(List<Cast> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cast {
    Cast({
        required this.person,
        required this.character,
        required this.self,
        required this.voice,
    });

    Person person;
    Character character;
    bool self;
    bool voice;

    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        person: Person.fromJson(json["person"]),
        character: Character.fromJson(json["character"]),
        self: json["self"],
        voice: json["voice"],
    );

    Map<String, dynamic> toJson() => {
        "person": person.toJson(),
        "character": character.toJson(),
        "self": self,
        "voice": voice,
    };
}

class Character {
    Character({
        required this.id,
        required this.url,
        required this.name,
        required this.image,
        required this.links,
    });

    int id;
    String url;
    String name;
    Image? image;
    Links links;

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        // ignore: prefer_null_aware_operators
        "image": image == null ? null : image?.toJson(),
        "_links": links.toJson(),
    };
}

class Image {
    Image({
        required this.medium,
        required this.original,
    });

    String medium;
    String original;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
    );

    Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
    };
}

class Links {
    Links({
        required this.self,
    });

    Self self;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: Self.fromJson(json["self"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self.toJson(),
    };
}

class Self {
    Self({
        required this.href,
    });

    String href;

    factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Person {
    Person({
        required this.id,
        required this.url,
        required this.name,
        required this.country,
        required this.birthday,
        required this.deathday,
        required this.gender,
        required this.image,
        required this.updated,
        required this.links,
    });

    int id;
    String url;
    String name;
    Country country;
    DateTime? birthday;
    dynamic deathday;
    Gender? gender;
    Image image;
    int updated;
    Links links;

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        country: Country.fromJson(json["country"]),
        birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        deathday: json["deathday"],
        gender: genderValues.map[json["gender"]],
        image: Image.fromJson(json["image"]),
        updated: json["updated"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "country": country.toJson(),
        "birthday": birthday == null ? null : "${birthday?.year.toString().padLeft(4, '0')}-${birthday?.month.toString().padLeft(2, '0')}-${birthday?.day.toString().padLeft(2, '0')}",
        "deathday": deathday,
        "gender": genderValues.reverse[gender],
        "image": image.toJson(),
        "updated": updated,
        "_links": links.toJson(),
    };
}

class Country {
    Country({
        required this.name,
        required this.code,
        required this.timezone,
    });

    Name? name;
    Code? code;
    Timezone? timezone;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: nameValues.map[json["name"]],
        code: codeValues.map[json["code"]],
        timezone: timezoneValues.map[json["timezone"]],
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "code": codeValues.reverse[code],
        "timezone": timezoneValues.reverse[timezone],
    };
}

enum Code { US, CA, GB }

final codeValues = EnumValues({
    "CA": Code.CA,
    "GB": Code.GB,
    "US": Code.US
});

enum Name { UNITED_STATES, CANADA, UNITED_KINGDOM }

final nameValues = EnumValues({
    "Canada": Name.CANADA,
    "United Kingdom": Name.UNITED_KINGDOM,
    "United States": Name.UNITED_STATES
});

enum Timezone { AMERICA_NEW_YORK, AMERICA_HALIFAX, EUROPE_LONDON }

final timezoneValues = EnumValues({
    "America/Halifax": Timezone.AMERICA_HALIFAX,
    "America/New_York": Timezone.AMERICA_NEW_YORK,
    "Europe/London": Timezone.EUROPE_LONDON
});

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({
    "Female": Gender.FEMALE,
    "Male": Gender.MALE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
