import 'package:apex_weapons/helpers/constants.dart';
import 'package:apex_weapons/providers/layout_provider.dart';
import 'package:apex_weapons/routing/tab_route.dart';
import 'package:apex_weapons/widgets/layout/mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: must_be_immutable
class LayoutWidget extends ConsumerWidget {
  List<Widget> list = tabRoutes().map((data) => data.widget).toList();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentPage = watch(layoutCNP).pageKey;

    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(
        tablet: MobileSize,
        desktop: DesktopSize,
        watch: 300,
      ),
      mobile: LayoutMobile(currentPage: currentPage, pages: list),
    );
  }
}
