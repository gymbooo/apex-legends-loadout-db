import 'package:flutter/foundation.dart';

class WeaponId {
  String id;

  WeaponId({
    @required this.id,
  });

  factory WeaponId.fromJson(dynamic json) {
    return WeaponId(
      id: json['id'] as String,
    );
  }
}
