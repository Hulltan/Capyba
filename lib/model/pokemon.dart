class Pokemon {
  String id = "";
  String name = "";
  String category = "";

  Pokemon(
    this.id,
    this.name,
    this.category,
  );

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
  }
}
