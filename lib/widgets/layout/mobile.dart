import 'package:apex_weapons/pages/register_weapon.dart';
import 'package:apex_weapons/themes/color.dart';
import 'package:apex_weapons/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apex_weapons/providers/providers.dart';

class LayoutMobile extends StatefulWidget {
  final int currentPage;
  final List<Widget> pages;

  const LayoutMobile({
    Key key,
    @required this.currentPage,
    @required this.pages,
  }) : super(key: key);

  @override
  _LayoutMobileState createState() => _LayoutMobileState();
}

class _LayoutMobileState extends State<LayoutMobile> {
  PageController _pageController;

  @override
  @mustCallSuper
  @protected
  void didUpdateWidget(LayoutMobile oldWidget) {
    _pageController.jumpToPage(widget.currentPage);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.currentPage);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final listOfWeaponTypesProvider = watch(listOfWeaponTypesCNP);
        final listOfAmmoTypeProvider = watch(listOfAmmoTypeCNP);
        final listOfFireModeProvider = watch(listOfFireModeCNP);
        final weaponProvider = watch(weaponCNP);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                CustomLogo(),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: white,
                ),
                onPressed: () async {
                  await listOfWeaponTypesProvider.getListOfWeaponTypes();
                  await listOfAmmoTypeProvider.getListOfAmmoType();
                  await listOfFireModeProvider.getListOfFireMode();

                  weaponProvider.clearForm();
                  weaponProvider.setWeaponTypeName(weaponTypeName: 'Pistol');
                  weaponProvider.setWeaponType(weaponType: '1');
                  weaponProvider.setAmmoType(ammoType: 'Light Rounds');
                  weaponProvider.setAmmoTypeId(ammoTypeId: '1');
                  weaponProvider.setFireMode(fireMode: 'Single');
                  weaponProvider.setFireModeId(fireModeId: '1');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterWeaponPage()),
                  );
                },
              ),
            ],
          ),
          body: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: widget.pages,
          ),
        );
      },
    );
  }
}
