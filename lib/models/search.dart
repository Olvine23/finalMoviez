class Search {
  Search({
    required this.score,
    required this.show,
  });

  dynamic score;
  Show show;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        score: json["score"].toDouble(),
        show: Show.fromJson(json["show"]),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "show": show.toJson(),
      };
}

class Show {
  Show({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.rating,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
  });

  dynamic id;
  dynamic url;
  dynamic name;
  dynamic type;
  dynamic language;
  List<String> genres;
  dynamic status;
  dynamic runtime;
  dynamic averageRuntime;
  dynamic premiered;
  dynamic ended;
  dynamic rating;
  dynamic image;
  dynamic summary;
  dynamic updated;
  Links links;

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        status: json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: DateTime.parse(json["premiered"]),
        ended: DateTime.parse(json["ended"]),
        rating: Rating.fromJson(json["rating"]),
        image: Image.fromJson(json["image"]),
        summary: json["summary"],
        updated: json["updated"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered":
            "${premiered.year.toString().padLeft(4, '0')}-${premiered.month.toString().padLeft(2, '0')}-${premiered.day.toString().padLeft(2, '0')}",
        "ended":
            "${ended.year.toString().padLeft(4, '0')}-${ended.month.toString().padLeft(2, '0')}-${ended.day.toString().padLeft(2, '0')}",
        "rating": rating.toJson(),
        "image": image.toJson(),
        "summary": summary,
        "updated": updated,
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
    required this.previousepisode,
  });

  Previousepisode previousepisode;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        previousepisode: Previousepisode.fromJson(json["previousepisode"]),
      );

  Map<String, dynamic> toJson() => {
        "previousepisode": previousepisode.toJson(),
      };
}

class Previousepisode {
  Previousepisode({
    required this.href,
  });

  String href;

  factory Previousepisode.fromJson(Map<String, dynamic> json) =>
      Previousepisode(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Rating {
  Rating({
    required this.average,
  });

  double average;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "average": average,
      };
}
