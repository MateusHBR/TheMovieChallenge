class ProductionCompany {
  int id;
  Null logoPath;
  String name;

  ProductionCompany({this.id, this.logoPath, this.name});

  ProductionCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "logo_path": this.logoPath,
      "name": this.name,
    };
  }
}
