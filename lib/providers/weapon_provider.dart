import 'package:apex_weapons/grapql/index.dart';
import 'package:apex_weapons/helpers/enums.dart';
import 'package:apex_weapons/helpers/graphql.dart';
import 'package:apex_weapons/providers/providers.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final weaponCNP = ChangeNotifierProvider<WeaponProvider>((ref) {
  return WeaponProvider();
});

class WeaponProvider extends AppStateNotifier {
  final GraphQLClient _graphqlClient = client.value;
  String _weaponType = '';
  String _weaponTypeName = '';
  String _ammoTypeId = '';
  String _ammoType = '';
  String _fireModeId = '';
  String _fireMode = '';
  bool _hasHopUp = false;
  bool _isSupplyDropWeapon = false;
  final TextEditingController _weaponIDController = TextEditingController();
  final TextEditingController _weaponNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _rateOfFireController = TextEditingController();
  final TextEditingController _headDamageController = TextEditingController();
  final TextEditingController _bodyDamageController = TextEditingController();
  final TextEditingController _armsLegsDamageController =
      TextEditingController();
  final TextEditingController _baseMagSizeController = TextEditingController();

  void setWeaponType({String weaponType}) {
    _weaponType = weaponType;
    notifyListeners();
  }

  void setWeaponTypeName({String weaponTypeName}) {
    _weaponTypeName = weaponTypeName;
    notifyListeners();
  }

  void setAmmoTypeId({String ammoTypeId}) {
    _ammoTypeId = ammoTypeId;
    notifyListeners();
  }

  void setAmmoType({String ammoType}) {
    _ammoType = ammoType;
    notifyListeners();
  }

  void setFireModeId({String fireModeId}) {
    _fireModeId = fireModeId;
    notifyListeners();
  }

  void setFireMode({String fireMode}) {
    _fireMode = fireMode;
    notifyListeners();
  }

  void updateHasHopUp({bool hasHopUp}) {
    _hasHopUp = hasHopUp;
    notifyListeners();
  }

  void updateIsSupplyDropWeapon({bool isSupplyDropWeapon}) {
    _isSupplyDropWeapon = isSupplyDropWeapon;
    notifyListeners();
  }

  void setWeaponID({String weaponID}) {
    _weaponIDController.text = weaponID;
    notifyListeners();
  }

  void setWeaponName({String weaponName}) {
    _weaponNameController.text = weaponName;
    notifyListeners();
  }

  void setDescription({String description}) {
    _descriptionController.text = description;
    notifyListeners();
  }

  void setimageUrl({String imageUrl}) {
    _imageUrlController.text = imageUrl;
    notifyListeners();
  }

  void setRateOfFire({String rateOfFire}) {
    _rateOfFireController.text = rateOfFire;
    notifyListeners();
  }

  void setHeadDamage({String headDamage}) {
    _headDamageController.text = headDamage;
    notifyListeners();
  }

  void setBodyDamage({String bodyDamage}) {
    _bodyDamageController.text = bodyDamage;
    notifyListeners();
  }

  void setArmsLegDamage({String armsLegDamage}) {
    _armsLegsDamageController.text = armsLegDamage;
    notifyListeners();
  }

  void setBaseMagSize({String baseMagSize}) {
    _baseMagSizeController.text = baseMagSize;
    notifyListeners();
  }

  void clearForm() {
    _weaponType = '1';
    // _weaponTypeName = '';
    // _ammoType = '';
    // _fireMode = '';
    _ammoTypeId = '1';
    _fireModeId = '1';
    _hasHopUp = false;
    _isSupplyDropWeapon = false;
    _weaponIDController.clear();
    _weaponNameController.clear();
    _descriptionController.clear();
    _imageUrlController.clear();
    _rateOfFireController.clear();
    _headDamageController.clear();
    _bodyDamageController.clear();
    _armsLegsDamageController.clear();
    _baseMagSizeController.clear();
    updateHasError(value: false);

    notifyListeners();
  }

  String get weaponType => _weaponType;
  String get weaponTypeName => _weaponTypeName;
  String get ammoTypeId => _ammoTypeId;
  String get ammoType => _ammoType;
  String get fireModeId => _fireModeId;
  String get fireMode => _fireMode;
  bool get hasHopUp => _hasHopUp;
  bool get isSupplyDropWeapon => _isSupplyDropWeapon;
  TextEditingController get weaponID => _weaponIDController;
  TextEditingController get weaponName => _weaponNameController;
  TextEditingController get description => _descriptionController;
  TextEditingController get imageUrl => _imageUrlController;
  TextEditingController get rateOfFire => _rateOfFireController;
  TextEditingController get headDamage => _headDamageController;
  TextEditingController get bodyDamage => _bodyDamageController;
  TextEditingController get armsLegsDamage => _armsLegsDamageController;
  TextEditingController get baseMagSize => _baseMagSizeController;

  Future registerWeapon() async {
    setState(AppState.Loading);
    updateHasError(value: false);
    final QueryResult result = await _graphqlClient.query(
      QueryOptions(document: gql(registerWeaponMutation), variables: {
        'id': _weaponIDController.text ?? '',
        'gun_id': _weaponType ?? '',
        'weapon_name': _weaponNameController.text ?? '',
        'description': _descriptionController.text ?? '',
        'image_url': _imageUrlController.text ?? '',
        'fire_mode_id': _fireModeId ?? '',
        'ammo_type_id': _ammoTypeId ?? '',
        'rate_of_fire': int.parse(_rateOfFireController.text) ?? 0,
        'head_damage': int.parse(_headDamageController.text) ?? 0,
        'body_damage': int.parse(_bodyDamageController.text) ?? 0,
        'legs_arms_damage': int.parse(_armsLegsDamageController.text) ?? 0,
        'base_mag_size': int.parse(_baseMagSizeController.text) ?? 0,
        'with_hop_up': _hasHopUp ?? false,
        'is_supply_drop_weapon': _isSupplyDropWeapon ?? false,
      }),
    );

    if (result.hasException) {
      print(result.exception.toString());
      return Text('No Data');
    }
    setState(AppState.Idle);
    notifyListeners();
  }

  Future editWeapon() async {
    setState(AppState.Loading);
    updateHasError(value: false);
    print(_weaponNameController.text);

    final QueryResult result = await _graphqlClient.query(
      QueryOptions(document: gql(editWeaponMutation), variables: {
        'id': _weaponIDController.text ?? '',
        'gun_id': _weaponType ?? '',
        'weapon_name': _weaponNameController.text ?? '',
        'description': _descriptionController.text ?? '',
        'image_url': _imageUrlController.text ?? '',
        'fire_mode_id': _fireModeId ?? '',
        'ammo_type_id': _ammoTypeId ?? '',
        'rate_of_fire': int.parse(_rateOfFireController.text) ?? 0,
        'head_damage': int.parse(_headDamageController.text) ?? 0,
        'body_damage': int.parse(_bodyDamageController.text) ?? 0,
        'legs_arms_damage': int.parse(_armsLegsDamageController.text) ?? 0,
        'base_mag_size': int.parse(_baseMagSizeController.text) ?? 0,
        'with_hop_up': _hasHopUp ?? false,
        'is_supply_drop_weapon': _isSupplyDropWeapon ?? false,
      }),
    );

    if (result.hasException) {
      print(result.exception.toString());
      return Text('No Data');
    }
    setState(AppState.Idle);
    notifyListeners();
  }
}
