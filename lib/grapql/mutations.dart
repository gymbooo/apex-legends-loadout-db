const String registerWeaponMutation = r'''
mutation registerWeapon(
  $id: ID!, 
  $gun_id: ID!, 
  $weapon_name: String!, 
  $description: String!, 
  $image_url: String!, 
  $fire_mode_id: ID!, 
  $ammo_type_id: ID!, 
  $rate_of_fire: Int!, 
  $head_damage: Int!, 
  $body_damage: Int!, 
  $legs_arms_damage: Int!, 
  $base_mag_size: Int!, 
  $with_hop_up: Boolean!, 
  $is_supply_drop_weapon: Boolean!) 
  {
  createWeapon(
    id: $id, 
    gun_id: $gun_id, 
    weapon_name: $weapon_name, 
    description: $description, 
    image_url: $image_url, 
    fire_mode_id: $fire_mode_id, 
    ammo_type_id: $ammo_type_id, 
    rate_of_fire: $rate_of_fire, 
    head_damage: $head_damage, 
    body_damage: $body_damage, 
    legs_arms_damage: $legs_arms_damage, 
    base_mag_size: $base_mag_size, 
    with_hop_up: $with_hop_up, 
    is_supply_drop_weapon: $is_supply_drop_weapon) {
    id
    weapon_name
  }
}
''';

const String editWeaponMutation = r'''
mutation editWeapon(
  $id: ID!, 
  $gun_id: ID!, 
  $weapon_name: String!, 
  $description: String!, 
  $image_url: String!, 
  $fire_mode_id: ID!, 
  $ammo_type_id: ID!, 
  $rate_of_fire: Int!, 
  $head_damage: Int!, 
  $body_damage: Int!, 
  $legs_arms_damage: Int!, 
  $base_mag_size: Int!, 
  $with_hop_up: Boolean!, 
  $is_supply_drop_weapon: Boolean!) 
  {
  updateWeapon(
    id: $id, 
    gun_id: $gun_id, 
    weapon_name: $weapon_name, 
    description: $description, 
    image_url: $image_url, 
    fire_mode_id: $fire_mode_id, 
    ammo_type_id: $ammo_type_id, 
    rate_of_fire: $rate_of_fire, 
    head_damage: $head_damage, 
    body_damage: $body_damage, 
    legs_arms_damage: $legs_arms_damage, 
    base_mag_size: $base_mag_size, 
    with_hop_up: $with_hop_up, 
    is_supply_drop_weapon: $is_supply_drop_weapon) {
    id
    weapon_name
  }
}
''';
