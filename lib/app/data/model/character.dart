/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Character {
  int? id;
  String? name;
  String? description;
  DateTime? modified;
  Thumbnail? thumbnail;
  String? resourceURI;
  Comic? comics;
  Serie? series;
  Storie? stories;
  Event? events;
  List<Url?>? urls;

  Character(
      {this.id,
      this.name,
      this.description,
      this.modified,
      this.thumbnail,
      this.resourceURI,
      this.comics,
      this.series,
      this.stories,
      this.events,
      this.urls});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = DateTime.parse(json['modified']);
    thumbnail = json['thumbnail'] != null
        ? Thumbnail?.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
    comics = json['comics'] != null ? Comic?.fromJson(json['comics']) : null;
    series = json['series'] != null ? Serie?.fromJson(json['series']) : null;
    stories =
        json['stories'] != null ? Storie?.fromJson(json['stories']) : null;
    events = json['events'] != null ? Event?.fromJson(json['events']) : null;
    if (json['urls'] != null) {
      urls = <Url>[];
      json['urls'].forEach((v) {
        urls!.add(Url.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['modified'] = modified;
    data['thumbnail'] = thumbnail!.toJson();
    data['resourceURI'] = resourceURI;
    data['comics'] = comics!.toJson();
    data['series'] = series!.toJson();
    data['stories'] = stories!.toJson();
    data['events'] = events!.toJson();
    data['urls'] = urls != null ? urls!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class Comic {
  int? available;
  String? collectionURI;
  List<Item?>? items;
  int? returned;

  Comic({this.available, this.collectionURI, this.items, this.returned});

  Comic.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    data['items'] =
        items != null ? items!.map((v) => v?.toJson()).toList() : null;
    data['returned'] = returned;
    return data;
  }
}

class Event {
  int? available;
  String? collectionURI;
  List<Item?>? items;
  int? returned;

  Event({this.available, this.collectionURI, this.items, this.returned});

  Event.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    data['items'] =
        items != null ? items!.map((v) => v?.toJson()).toList() : null;
    data['returned'] = returned;
    return data;
  }
}

class Item {
  String? resourceURI;
  String? name;
  String? type;

  Item({this.resourceURI, this.name, this.type});

  Item.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}

class Root {
  Character? character;

  Root({this.character});

  Root.fromJson(Map<String, dynamic> json) {
    character = json['character'] != null
        ? Character?.fromJson(json['character'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['character'] = character!.toJson();
    return data;
  }
}

class Serie {
  int? available;
  String? collectionURI;
  List<Item?>? items;
  int? returned;

  Serie({this.available, this.collectionURI, this.items, this.returned});

  Serie.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    data['items'] =
        items != null ? items!.map((v) => v?.toJson()).toList() : null;
    data['returned'] = returned;
    return data;
  }
}

class Storie {
  int? available;
  String? collectionURI;
  List<Item?>? items;
  int? returned;

  Storie({this.available, this.collectionURI, this.items, this.returned});

  Storie.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    data['items'] =
        items != null ? items!.map((v) => v?.toJson()).toList() : null;
    data['returned'] = returned;
    return data;
  }
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['path'] = path;
    data['extension'] = extension;
    return data;
  }
}

class Url {
  String? type;
  String? url;

  Url({this.type, this.url});

  Url.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}
