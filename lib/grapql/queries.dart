const String getWeaponTypesQuery = r'''
  query getWeaponTypes{
    allGuns{
      id
      gun_type
      guns_image_url
    }
  }
''';

const String getWeaponsOfThisTypeQuery = r'''
query getWeaponsOfThisType($id: ID!) {
  Gun(id: $id) {
    id
    gun_type
    Weapons {
      id
      gun_id
      Gun{
        gun_type
      }
      weapon_name
      description
      image_url
      FireMode{
        id
        fire_mode_name
      }
      AmmoType{
        id
        ammo_type_name
      }
      rate_of_fire
      head_damage
      body_damage
      legs_arms_damage
      base_mag_size
      with_hop_up
      is_supply_drop_weapon
    }
  }
}
''';

const String getAmmoTypesQuery = r'''
query allAmmoTypes {
  allAmmoTypes{
    id
    ammo_type_name
  }
}
''';

const String getWeaponsOfThisAmmoTypeQuery = r'''
query AmmoType($id: ID!) {
  AmmoType(id: $id) {
    id
    ammo_type_name
    Weapons{
      id
      weapon_name
    }
  }
}
''';

const String getFireModesQuery = r'''
query allFireModes {
  allFireModes {
    id
    fire_mode_name
  }
}
''';

const String getWeaponsOfThisFireModeQuery = r'''
query FireMode($id:ID!) {
  FireMode(id:$id) {
    id
    fire_mode_name
    Weapons{
      id
      weapon_name
    }
  }
}
''';

const String getWeaponIdsQuery = r'''
query allWeapons{
  allWeapons{
    id
  }
}
''';
