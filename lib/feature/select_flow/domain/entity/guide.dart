class Guide {
  String? name;
  String? noHp;

  Guide({
    this.name,
    this.noHp,
  });

  factory Guide.fromJson(Map<String, dynamic> json) {
    return Guide(
      name: json["name"],
      noHp: json["no_hp"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nama": name,
      "no_hp": noHp,
    };
  }
}
