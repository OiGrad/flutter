import 'package:kemet/models/city.dart';
import 'package:kemet/models/place_category.dart';

class Place {
  int id;
  City city;
  PlaceCategory category;

  List<dynamic> gallery;
  String main_Image;
  String name;
  int price;
  var rate;
  String info;
  String location_text;

  // Location location;

  Place({
    required this.id,
    required this.city,
    required this.category,
    required this.gallery,
    required this.main_Image,
    required this.name,
    required this.price,
    required this.rate,
    required this.info,
    required this.location_text,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: int.parse(json["id"]),
      city: City.fromJson(json["city"]),
      category: PlaceCategory.fromJson(json["category"]),
      gallery: List.of(json["gallery"]).map((i) => json["gallery"]).toList(),
      main_Image: json["main_Image"],
      name: json["name"],
      price: int.parse(json["price"]),
      rate: json["rate"],
      info: json["info"],
      location_text: json["location_text"],
    );
  }
//
}
