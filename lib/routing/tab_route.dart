import 'package:apex_weapons/pages/home_page.dart';
import 'package:apex_weapons/pages/register_weapon.dart';
import 'package:flutter/material.dart';

class TabRouteModel {
  TabRouteModel({
    this.route,
    this.widget,
  });

  String route;
  Widget widget;
}

List<TabRouteModel> tabRoutes() {
  return [
    TabRouteModel(
      route: 'home',
      widget: HomePage(),
    ),
    TabRouteModel(
      route: 'register-new-weapon',
      widget: RegisterWeaponPage(),
    ),
    // TabRouteModel(
    //   route: 'layout-widget',
    //   widget: LayoutWidget(),
    // ),
  ];
}

int getRouteIndex(String routName) {
  return tabRoutes().indexWhere((data) => data.route == routName);
}
