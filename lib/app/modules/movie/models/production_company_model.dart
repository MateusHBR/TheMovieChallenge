class ProductionCompany {
  int id;
  String name;

  ProductionCompany({this.id, this.name});

  ProductionCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
    };
  }
}
