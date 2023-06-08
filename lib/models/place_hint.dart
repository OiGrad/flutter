class PlaceHint {
  int id;
  String name;
  String image;
  PlaceHint({
    required this.id,
    required this.name,
    required this.image,
  });

  factory PlaceHint.fromJson(Map<String, dynamic> json) {
    return PlaceHint(
      id: json['id'],
      name: json['name'],
      image: json['image'] ?? json['main_Image'],
    );
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
