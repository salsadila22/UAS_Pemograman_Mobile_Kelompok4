import 'package:keliling_pontianak/feature/select_flow/domain/entity/guide.dart';

class Location {
  String? name;
  String? desc;
  List<Guide>? guide;
  String? directGuide;

  Location({
    this.name,
    this.desc,
    this.guide,
    this.directGuide,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json["nama"],
      desc: json["deskripsi"],
      guide: List<Guide>.from(
        (json["guide"] as List).map(
          (e) => Guide(
            name: e["nama"],
            noHp: e["no_hp"],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nama": name,
      "deskripsi": desc,
      "pemandu": List.from(
        guide!.map(
          (e) => e.toJson(),
        ),
      ),
    };
  }
}
