//these two classes are here to help in decoding json data.
class PlaceList {
  List<Place> list;
  PlaceList({this.list});

  factory PlaceList.fromJson(List<dynamic> parsedJson) {
    var lists = parsedJson;
    List<Place> itemLists = lists.map((f) => Place.fromJson(f)).toList();
    return PlaceList(list: itemLists);
  }
}

class Place {
  String name;
  int id;
  String photo;
  String highlights;
  Place({this.id, this.name, this.photo, this.highlights});
  factory Place.fromJson(Map<String, dynamic> parsedJson) {
    return Place(
        id: parsedJson['id'],
        name: parsedJson['name'],
        photo: parsedJson['photo'],
        highlights: parsedJson['highlights'],
    );
  }
}

//https://www.developerlibs.com/2018/11/flutter-how-to-parse-local-json-file-in.html