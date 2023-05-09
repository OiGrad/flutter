class PlaceHint {
  int id;
  String name;
  String image;
  String text;
  PlaceHint({
    required this.id,
    required this.name,
    required this.image,
    required this.text,
  });

  factory PlaceHint.fromJson(Map<String, dynamic> json) {
    return PlaceHint(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      text: json['text'],
    );
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'text': text,
    };
  }
}
