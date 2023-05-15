// To parse this JSON data, do
//
//     final story = storyFromJson(jsonString);

import 'dart:convert';

Story storyFromJson(String str) => Story.fromJson(json.decode(str));

String storyToJson(Story data) => json.encode(data.toJson());

class Story {
  int id;
  String title;
  String description;
  String resourceUri;
  String type;
  String modified;
  dynamic thumbnail;
  Characters creators;
  Characters characters;
  Characters series;
  Characters comics;
  Characters events;
  OriginalIssue originalIssue;

  Story({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.type,
    required this.modified,
    this.thumbnail,
    required this.creators,
    required this.characters,
    required this.series,
    required this.comics,
    required this.events,
    required this.originalIssue,
  });

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        type: json["type"],
        modified: json["modified"],
        thumbnail: json["thumbnail"],
        creators: Characters.fromJson(json["creators"]),
        characters: Characters.fromJson(json["characters"]),
        series: Characters.fromJson(json["series"]),
        comics: Characters.fromJson(json["comics"]),
        events: Characters.fromJson(json["events"]),
        originalIssue: OriginalIssue.fromJson(json["originalIssue"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "type": type,
        "modified": modified,
        "thumbnail": thumbnail,
        "creators": creators.toJson(),
        "characters": characters.toJson(),
        "series": series.toJson(),
        "comics": comics.toJson(),
        "events": events.toJson(),
        "originalIssue": originalIssue.toJson(),
      };
}

class Characters {
  int available;
  String collectionUri;
  List<OriginalIssue> items;
  int returned;

  Characters({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<OriginalIssue>.from(
            json["items"].map((x) => OriginalIssue.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
      };
}

class OriginalIssue {
  String resourceUri;
  String name;

  OriginalIssue({
    required this.resourceUri,
    required this.name,
  });

  factory OriginalIssue.fromJson(Map<String, dynamic> json) => OriginalIssue(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}
