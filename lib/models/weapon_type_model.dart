import 'package:flutter/foundation.dart';

class WeaponType {
  String id;
  String gunType;
  String gunImageUrl;
  // List<String> assignedProjects;

  WeaponType({
    @required this.id,
    @required this.gunType,
    @required this.gunImageUrl,
  });

  factory WeaponType.fromJson(dynamic json) {
    return WeaponType(
      id: json['id'] as String,
      gunType: json['gun_type'] as String,
      gunImageUrl: json['guns_image_url'] as String,
    );
  }
}
