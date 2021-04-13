import 'package:flutter/foundation.dart';

class FireMode {
  String id;
  String fireMode;

  FireMode({
    @required this.id,
    @required this.fireMode,
  });

  factory FireMode.fromJson(dynamic json) {
    return FireMode(
      id: json['id'] as String,
      fireMode: json['fire_mode_name'] as String,
    );
  }
}
