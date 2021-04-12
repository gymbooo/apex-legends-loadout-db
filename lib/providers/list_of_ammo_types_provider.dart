import 'package:apex_weapons/grapql/queries.dart';
import 'package:apex_weapons/helpers/enums.dart';
import 'package:apex_weapons/helpers/graphql.dart';
import 'package:apex_weapons/models/models.dart';
import 'package:apex_weapons/providers/providers.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final listOfAmmoTypeCNP = ChangeNotifierProvider<ListOfAmmoTypeNotifier>((ref) {
  return ListOfAmmoTypeNotifier();
});

class ListOfAmmoTypeNotifier extends AppStateNotifier {
  final GraphQLClient _graphqlClient = client.value;
  List<AmmoType> _listOfAmmoType = [];
  List<String> _listOfAmmoTypeString = [];

  List<AmmoType> get listofAmmoType => _listOfAmmoType;
  List<String> get listOfAmmoTypeString => _listOfAmmoTypeString;

  void setListOfAmmoTypeString({List<String> listOfAmmoTypeString}) {
    _listOfAmmoTypeString = listOfAmmoTypeString;
    notifyListeners();
  }

  Future getListOfAmmoType() async {
    setState(AppState.Loading);
    updateHasError(value: false);
    final QueryResult result = await _graphqlClient.query(
      QueryOptions(
        document: gql(getAmmoTypesQuery),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      updateHasError(value: true);
      return Text('No Data');
    } else {}
    final List<dynamic> dataGuns = result.data['allAmmoTypes'] as List<dynamic>;
    _listOfAmmoType = dataGuns.map((item) => AmmoType.fromJson(item)).toList();
    setState(AppState.Idle);
    notifyListeners();
  }
}
