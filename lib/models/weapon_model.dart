import 'package:flutter/foundation.dart';

class Weapon {
  String id;
  String gunId;
  String gunTypeName;
  String weaponName;
  String description;
  String imageUrl;
  String fireModeId;
  String fireMode;
  String ammoTypeId;
  String ammoType;
  int rateOfFire;
  int headDamage;
  int bodyDamage;
  int legsArmsDamage;
  int baseMagSize;
  bool withHopUp;
  bool isSupplyDropWeapon;

  Weapon({
    @required this.id,
    @required this.gunId,
    @required this.gunTypeName,
    @required this.weaponName,
    @required this.description,
    @required this.imageUrl,
    @required this.fireModeId,
    @required this.fireMode,
    @required this.ammoTypeId,
    @required this.ammoType,
    @required this.rateOfFire,
    @required this.headDamage,
    @required this.bodyDamage,
    @required this.legsArmsDamage,
    @required this.baseMagSize,
    @required this.withHopUp,
    @required this.isSupplyDropWeapon,
  });

  factory Weapon.fromJson(dynamic json) {
    return Weapon(
      id: json['id'] as String,
      gunId: json['gun_id'] as String,
      gunTypeName: json['Gun']['gun_type'] as String,
      weaponName: json['weapon_name'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      fireModeId: json['FireMode']['id'] as String,
      fireMode: json['FireMode']['fire_mode_name'] as String,
      ammoTypeId: json['AmmoType']['id'] as String,
      ammoType: json['AmmoType']['ammo_type_name'] as String,
      rateOfFire: json['rate_of_fire'] as int,
      headDamage: json['head_damage'] as int,
      bodyDamage: json['body_damage'] as int,
      legsArmsDamage: json['legs_arms_damage'] as int,
      baseMagSize: json['base_mag_size'] as int,
      withHopUp: json['with_hop_up'],
      isSupplyDropWeapon: json['is_supply_drop_weapon'],
    );
  }
}
