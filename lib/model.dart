class CharacterModel {
  final String name;
  final String realName;
  final String imageUrl;

  CharacterModel({
    required this.name,
    required this.realName,
    required this.imageUrl,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json["name"] ?? "",
      realName: json["realname"] ?? "",
      imageUrl: json["imageurl"] ?? "",
    );
  }
}
