import 'package:flutter/foundation.dart';

class AmmoType {
  String id;
  String ammoType;

  AmmoType({
    @required this.id,
    @required this.ammoType,
  });

  factory AmmoType.fromJson(dynamic json) {
    return AmmoType(
      id: json['id'] as String,
      ammoType: json['ammo_type_name'] as String,
    );
  }
}
