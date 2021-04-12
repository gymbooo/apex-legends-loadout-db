import 'package:apex_weapons/pages/home_page.dart';
import 'package:apex_weapons/pages/register_weapon.dart';
import 'package:apex_weapons/pages/view_list_of_weapons_of_this_type_page.dart';
import 'package:apex_weapons/widgets/layout/layout.dart';
import 'package:flutter/material.dart';
import 'route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage());
    case ViewListOfWeaponsOfThisTypeRoute:
      return _getPageRoute(ViewListOfWeaponsOfThisTypePage());
    case RegisterNewWeaponRoute:
      return _getPageRoute(RegisterWeaponPage());
    case LayoutWidgetRoute:
      return _getPageRoute(LayoutWidget());
    default:
      return _getPageRoute(HomePage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
