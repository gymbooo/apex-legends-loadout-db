import 'package:apex_weapons/pages/register_weapon.dart';
import 'package:apex_weapons/providers/providers.dart';
import 'package:apex_weapons/routing/route_names.dart';
import 'package:apex_weapons/themes/color.dart';
import 'package:apex_weapons/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewListOfWeaponsOfThisTypePage extends StatefulWidget {
  @override
  _ViewListOfWeaponsOfThisTypePageState createState() =>
      _ViewListOfWeaponsOfThisTypePageState();
}

class _ViewListOfWeaponsOfThisTypePageState
    extends State<ViewListOfWeaponsOfThisTypePage> {
  @override
  Widget build(BuildContext context) {
    int initPosition = 0;
    return Consumer(
      builder: (context, watch, child) {
        final listOfWeaponsOfThisTypeProvider =
            watch(listOfWeaponsOfThisTypeCNP);
        final listOfWeaponTypesProvider = watch(listOfWeaponTypesCNP);
        final listOfAmmoTypeProvider = watch(listOfAmmoTypeCNP);
        final listOfFireModeProvider = watch(listOfFireModeCNP);
        final listOfWeaponIdsProvider = watch(listOfWeaponIdsCNP);
        final weaponProvider = watch(weaponCNP);
        final title = listOfWeaponsOfThisTypeProvider.weaponTypeName;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: CustomLogo(
              title: '$title' + 's',
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: white,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LayoutWidgetRoute);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: white,
                ),
                onPressed: () async {
                  await listOfWeaponTypesProvider.getListOfWeaponTypes();
                  await listOfAmmoTypeProvider.getListOfAmmoType();
                  await listOfFireModeProvider.getListOfFireMode();
                  await listOfWeaponIdsProvider.getListOfWeaponIds();
                  List<String> _weaponTypeList = [];
                  listOfWeaponTypesProvider.listofWeaponTypes
                      .forEach((element) {
                    _weaponTypeList.add(element.gunType);
                  });
                  String weaponId = (int.parse(listOfWeaponIdsProvider
                              .listOfWeaponIds
                              .elementAt(listOfWeaponIdsProvider
                                      .listOfWeaponIds.length -
                                  1)
                              .id) +
                          1)
                      .toString();
                  weaponProvider.clearForm();

                  weaponProvider.setWeaponTypeName(
                      weaponTypeName: _weaponTypeList.elementAt(
                          int.parse(listOfWeaponTypesProvider.gunId) - 1));
                  weaponProvider.setWeaponType(
                      weaponType: listOfWeaponTypesProvider.gunId);

                  weaponProvider.setAmmoType(
                      ammoType: listOfWeaponTypesProvider.gunId.contains('2')
                          ? 'Shotgun Shells'
                          : 'Light Rounds');
                  weaponProvider.setAmmoTypeId(
                      ammoTypeId: listOfWeaponTypesProvider.gunId.contains('2')
                          ? '2'
                          : '1');
                  weaponProvider.setFireMode(fireMode: 'Single');
                  weaponProvider.setFireModeId(fireModeId: '1');
                  weaponProvider.setWeaponID(weaponID: weaponId);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterWeaponPage()),
                  );
                },
              ),
            ],
          ),
          body: Container(
            child: CustomTabView(
              initPosition: initPosition,
              itemCount: listOfWeaponsOfThisTypeProvider
                  .listOfWeaponsOfThisType.length,
              tabBuilder: (context, index) => Tab(
                  text: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].weaponName),
              pageBuilder: (context, index) => CustomTabViewPage(
                  id: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].id,
                  gunId: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].gunId,
                  gunTypeName: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].gunTypeName,
                  weaponName: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].weaponName,
                  description: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].description,
                  imageUrl: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].imageUrl,
                  fireModeId: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].fireModeId,
                  fireMode: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].fireMode,
                  ammoTypeId: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].ammoTypeId,
                  ammoType: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].ammoType,
                  rateOfFire: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].rateOfFire,
                  headDamage: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].headDamage,
                  bodyDamage: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].bodyDamage,
                  legsArmsDamage: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].legsArmsDamage,
                  baseMagSize: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].baseMagSize,
                  withHopUp: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].withHopUp,
                  isSupplyDropWeapon: listOfWeaponsOfThisTypeProvider
                      .listOfWeaponsOfThisType[index].isSupplyDropWeapon),
              onPositionChange: (index) {
                initPosition = index;
              },
              onScroll: (position) => null,
            ),
          ),
        );
      },
    );
  }
}

/// Implementation
