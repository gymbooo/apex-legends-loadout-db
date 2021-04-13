import 'package:apex_weapons/providers/providers.dart';
import 'package:apex_weapons/routing/route_names.dart';
import 'package:apex_weapons/themes/color.dart';
import 'package:apex_weapons/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeaponForm extends StatefulWidget {
  final String type;
  final String title;

  const WeaponForm({
    Key key,
    this.type = 'register',
    this.title,
  }) : super(key: key);
  @override
  _WeaponFormState createState() => _WeaponFormState();
}

class _WeaponFormState extends State<WeaponForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final listOfWeaponTypesProvider = watch(listOfWeaponTypesCNP);
        final listOfAmmoTypeProvider = watch(listOfAmmoTypeCNP);
        final listOfFireModeProvider = watch(listOfFireModeCNP);
        // final dropDownFieldProvider = watch(dropDownFieldCNP);
        final listOfThisWeaponTypeProvider = watch(listOfWeaponsOfThisTypeCNP);
        final weaponProvider = watch(weaponCNP);
        List<String> _ammoTypeList = [];
        List<String> _fireModeList = [];
        List<String> _weaponTypeList = [];

        listOfAmmoTypeProvider.listofAmmoType.forEach((element) {
          _ammoTypeList.add(element.ammoType);
        });
        listOfFireModeProvider.listOfFireMode.forEach((element) {
          _fireModeList.add(element.fireMode);
        });
        listOfWeaponTypesProvider.listofWeaponTypes.forEach((element) {
          _weaponTypeList.add(element.gunType);
        });

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: CustomLogo(
              title: widget.title,
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: white,
                ),
                onPressed: () async {
                  // if (dropDownFieldProvider.isDropdownOpened) {
                  //   dropDownFieldProvider.floatingDropdown.remove();
                  //   dropDownFieldProvider.updateDropDown(
                  //       status: !dropDownFieldProvider.isDropdownOpened);
                  // }
                  // Navigator.pop(context);
                  if (widget.type.contains('edit')) {
                    listOfThisWeaponTypeProvider.clearAll();
                    await listOfThisWeaponTypeProvider.getWeaponsOfThisType(
                        id: listOfWeaponTypesProvider.gunId);
                    Navigator.pushReplacementNamed(
                        context, ViewListOfWeaponsOfThisTypeRoute);
                  } else if (widget.type.contains('register')) {
                    // await listOfWeaponTypesProvider.getListOfWeaponTypes();
                    // await listOfAmmoTypeProvider.getListOfAmmoType();
                    // await listOfFireModeProvider.getListOfFireMode();
                    // await listOfWeaponTypesProvider.getListOfWeaponTypes();
                    // listOfThisWeaponTypeProvider.clearAll();
                    // await listOfThisWeaponTypeProvider.getWeaponsOfThisType(
                    //     id: listOfWeaponTypesProvider.gunId);
                    // Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, LayoutWidgetRoute);
                  }
                },
              ),
              if (widget.type.contains('edit'))
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: white,
                  ),
                  onPressed: () {
                    listOfThisWeaponTypeProvider.clearAll();
                    Navigator.pushReplacementNamed(context, LayoutWidgetRoute);
                  },
                ),
              IconButton(
                icon: Icon(
                  Icons.save,
                  color: white,
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return CustomConfirmModal(
                          icon: 'question',
                          header: widget.type.contains('register')
                              ? 'Would you like to register this gun?'
                              : 'Would you like to make changes to this gun?',
                          headerColor: Colors.grey,
                          subHeaderOne: '',
                          subHeaderTwo: '',
                          secondaryButtonText: 'No',
                          secondaryFunction: () {},
                          primaryButtonText: 'Yes',
                          primaryFunction: () async {
                            if (widget.type.contains('register')) {
                              await weaponProvider.registerWeapon();
                            } else {
                              await weaponProvider.editWeapon();
                            }
                            if (weaponProvider.hasError) {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return CustomConfirmModal(
                                    icon: 'negative',
                                    header: "Can't Register Weapon!",
                                    headerColor: Color(0xffeb2121),
                                    subHeaderOne:
                                        '${weaponProvider.weaponName.text} maybe already exists',
                                    subHeaderTwo:
                                        'or input fields are invalid.',
                                    secondaryFunction: () {},
                                    primaryButtonText: 'Got it',
                                    primaryFunction: () {},
                                  );
                                },
                              );
                            } else {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return CustomConfirmModal(
                                    icon: 'positive',
                                    header: widget.type.contains('register')
                                        ? '${weaponProvider.weaponName.text} successfully registered!'
                                        : '${weaponProvider.weaponName.text} edited!',
                                    headerColor: Colors.grey,
                                    subHeaderOne: '',
                                    subHeaderTwo: '',
                                    secondaryFunction: () {},
                                    primaryButtonText: 'Got it',
                                    primaryFunction: () {},
                                  );
                                },
                              );
                            }
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
          body: GestureDetector(
            onTap: () {},
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            title: 'Weapon ID',
                            titleSize: 12,
                            placeholder: 'Weapon ID',
                            hasBottomSpace: false,
                            controller: weaponProvider.weaponID,
                          ),
                          CustomTextFormField(
                            title: 'Weapon Name',
                            titleSize: 12,
                            placeholder: 'Weapon Name',
                            hasBottomSpace: false,
                            controller: weaponProvider.weaponName,
                          ),
                          CustomDropDown(
                            title: 'Weapon Type',
                            titleSize: 12,
                            items: _weaponTypeList,
                            placeholder: weaponProvider.weaponTypeName,
                            width: double.infinity,
                            iconSize: 20,
                            function: (val) {
                              weaponProvider.setWeaponTypeName(
                                  weaponTypeName: val);
                              weaponProvider.setWeaponType(
                                  weaponType: (_weaponTypeList.indexOf(val) + 1)
                                      .toString());
                              if (val.contains('Shotgun')) {
                                setState(() {
                                  weaponProvider.setAmmoType(
                                      ammoType: 'Shotgun Shells');
                                  weaponProvider.setAmmoTypeId(
                                      ammoTypeId: (_ammoTypeList
                                                  .indexOf('Shotgun Shells') +
                                              1)
                                          .toString());
                                });
                              }
                              print(weaponProvider.weaponType);
                            },
                          ),
                          CustomTextFormField(
                            title: 'Description',
                            titleSize: 12,
                            placeholder: 'Description',
                            hasBottomSpace: false,
                            controller: weaponProvider.description,
                          ),
                          CustomTextFormField(
                            title: 'Weapon Image URL',
                            titleSize: 12,
                            placeholder: 'Weapon Image URL',
                            hasBottomSpace: false,
                            controller: weaponProvider.imageUrl,
                            isURLField: true,
                          ),
                          CustomDropDown(
                            title: 'Ammo Type',
                            titleSize: 12,
                            items: _ammoTypeList,
                            placeholder: weaponProvider.ammoType,
                            width: double.infinity,
                            iconSize: 20,
                            function: (val) {
                              weaponProvider.setAmmoType(ammoType: val);
                              weaponProvider.setAmmoTypeId(
                                  ammoTypeId: (_ammoTypeList.indexOf(val) + 1)
                                      .toString());

                              print(weaponProvider.ammoTypeId);
                            },
                          ),
                          CustomDropDown(
                            title: 'Fire Mode',
                            titleSize: 12,
                            items: _fireModeList,
                            placeholder: weaponProvider.fireMode,
                            width: double.infinity,
                            iconSize: 20,
                            function: (val) {
                              weaponProvider.setFireMode(fireMode: val);
                              weaponProvider.setFireModeId(
                                  fireModeId: (_fireModeList.indexOf(val) + 1)
                                      .toString());
                              print(weaponProvider.fireModeId);
                            },
                          ),
                          CustomTextFormField(
                            title: 'Rate Of Fire',
                            titleSize: 12,
                            placeholder: 'Rate Of Fire',
                            hasBottomSpace: false,
                            controller: weaponProvider.rateOfFire,
                            isNumberField: true,
                          ),
                          CustomTextFormField(
                            title: 'Head Damage',
                            titleSize: 12,
                            placeholder: 'Head Damage',
                            hasBottomSpace: false,
                            controller: weaponProvider.headDamage,
                            isNumberField: true,
                          ),
                          CustomTextFormField(
                            title: 'Body Damage',
                            titleSize: 12,
                            placeholder: 'Body Damage',
                            hasBottomSpace: false,
                            controller: weaponProvider.bodyDamage,
                            isNumberField: true,
                          ),
                          CustomTextFormField(
                            title: 'Arms & Legs Damage',
                            titleSize: 12,
                            placeholder: 'Arms & Legs Damage',
                            hasBottomSpace: false,
                            controller: weaponProvider.armsLegsDamage,
                            isNumberField: true,
                          ),
                          CustomTextFormField(
                            title: 'Base Mag Size',
                            titleSize: 12,
                            placeholder: 'Base Mag Size',
                            hasBottomSpace: false,
                            controller: weaponProvider.baseMagSize,
                            isNumberField: true,
                          ),
                          CustomCheckBox(
                            title: 'Has Hop Up?',
                            titleSize: 12,
                            placeholder: 'Has Hop Up?',
                            hasBottomSpace: false,
                            checkBoxType: 'hasHopUp',
                          ),
                          CustomCheckBox(
                            title: 'Is Supply Drop Weapon?',
                            titleSize: 12,
                            placeholder: 'Is Supply Drop Weapon?',
                            hasBottomSpace: false,
                            checkBoxType: 'isSupplyDropWeapon',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
