import 'package:apex_weapons/providers/providers.dart';
import 'package:apex_weapons/routing/route_names.dart';
import 'package:apex_weapons/themes/color.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ListOfWeaponTypesNotifier listOfWeaponTypesProvider =
      ListOfWeaponTypesNotifier();
  bool loading = false;
  List listofWeaponTypes = [];

  void getData() async {
    setState(() {
      loading = true;
    });

    await listOfWeaponTypesProvider.getListOfWeaponTypes();
    setState(() {
      listofWeaponTypes = listOfWeaponTypesProvider.listofWeaponTypes;
    });
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    listOfWeaponTypesProvider.listofWeaponTypes.clear();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final listOfWeaponTypesProvider = watch(listOfWeaponTypesCNP);
        final listOfWeaponsOfthisTypeProvider =
            watch(listOfWeaponsOfThisTypeCNP);
        return Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Center(
            child: ListView.builder(
              itemCount: listofWeaponTypes.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            listOfWeaponTypesProvider.setGunId(
                                gunId: (i + 1).toString());
                            print(listOfWeaponTypesProvider.gunId);
                            await listOfWeaponsOfthisTypeProvider
                                .getWeaponsOfThisType(id: (i + 1).toString());
                            Navigator.pushReplacementNamed(
                                context, ViewListOfWeaponsOfThisTypeRoute);
                          },
                          child: Parallelogram(
                            cutLength: 50.0,
                            edge: Edge.RIGHT,
                            child: Container(
                              height: 245,
                              color: primary,
                              padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      listofWeaponTypes[i].gunImageUrl,
                                      width: 200,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      listofWeaponTypes[i].gunType.toString() +
                                          's',
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
