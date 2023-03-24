// ignore: file_names
// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'dart:convert';

class CatalogModel {
  static List<People> peoples = [];
}

class People {
  final String image;
  final String name;

  People({
    required this.image,
    required this.name,
  });

  People copyWith({
    String? image,
    String? name,
  }) {
    return People(
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': name,
    };
  }

  factory People.fromMap(Map<String, dynamic> map) {
    return People(
      image: map['image'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory People.fromJson(String source) =>
      People.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'People(image: $image, name: $name)';

  @override
  bool operator ==(covariant People other) {
    if (identical(this, other)) return true;

    return other.image == image && other.name == name;
  }

  @override
  int get hashCode => image.hashCode ^ name.hashCode;
}
