// To parse this JSON data, do
//
//     final homeScreen = homeScreenFromMap(jsonString);

import 'dart:convert';

List<HomeScreen> homeScreenFromMap(String str) => List<HomeScreen>.from(json.decode(str).map((x) => HomeScreen.fromMap(x)));

String homeScreenToMap(List<HomeScreen> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class HomeScreen {
  HomeScreen({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
    required this.updatedAt,
    required this.featured,
    required this.launches,
    required this.events,
  });

  String id;
  String title;
  String url;
  String imageUrl;
  String newsSite;
  String summary;
  DateTime publishedAt;
  DateTime updatedAt;
  bool featured;
  List<Launch> launches;
  List<Event> events;

  factory HomeScreen.fromMap(Map<String, dynamic> json) => HomeScreen(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    imageUrl: json["imageUrl"],
    newsSite: json["newsSite"],
    summary: json["summary"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    featured: json["featured"],
    launches: List<Launch>.from(json["launches"].map((x) => Launch.fromMap(x))),
    events: List<Event>.from(json["events"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "url": url,
    "imageUrl": imageUrl,
    "newsSite": newsSite,
    "summary": summary,
    "publishedAt": publishedAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "featured": featured,
    "launches": List<dynamic>.from(launches.map((x) => x.toMap())),
    "events": List<dynamic>.from(events.map((x) => x)),
  };
}

class Launch {
  Launch({
    required this.id,
    required this.provider,
  });

  String id;
  String provider;

  factory Launch.fromMap(Map<String, dynamic> json) => Launch(
    id: json["id"],
    provider: json["provider"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "provider": provider,
  };
}
class Event {
  Event({
    required this.id,
    required this.provider,
  });

  String id;
  String provider;

  factory Event.fromMap(Map<String, dynamic> json) => Event(
    id: json["id"],
    provider: json["provider"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "provider": provider,
  };
}
