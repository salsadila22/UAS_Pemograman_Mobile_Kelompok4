import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keliling_pontianak/feature/select_flow/domain/entity/guide.dart';
import 'package:keliling_pontianak/feature/select_flow/domain/entity/location.dart';

class LocationModels {
  String? name;
  List<Location>? location;
  String? directLocation;

  LocationModels({
    this.name,
    this.location,
    this.directLocation,
  });

  factory LocationModels.fromJson(DocumentSnapshot json) {
    return LocationModels(
      name: json["nama"],
      location: json["lokasi"] is List
          ? List.from(
              (json["lokasi"] as List).map(
                (e) => Location(
                  name: e["nama"],
                  desc: e["desc"],
                  guide: e["pemandu"] is List
                      ? List<Guide>.from(
                          (e["pemandu"] as List).map(
                            (e) => Guide(
                              name: e["nama"],
                              noHp: e["no_hp"],
                            ),
                          ),
                        )
                      : null,
                  directGuide: e["pemandu"] is String ? e["pemandu"] : null,
                ),
              ),
            )
          : null,
      directLocation: json["lokasi"] is String ? json["lokasi"] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nama": name,
      "lokasi": directLocation ?? location,
    };
  }
}
