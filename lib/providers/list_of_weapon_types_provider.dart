import 'package:apex_weapons/grapql/queries.dart';
import 'package:apex_weapons/helpers/enums.dart';
import 'package:apex_weapons/helpers/graphql.dart';
import 'package:apex_weapons/models/models.dart';
import 'package:apex_weapons/providers/app_state_provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final listOfWeaponTypesCNP =
    ChangeNotifierProvider<ListOfWeaponTypesNotifier>((ref) {
  return ListOfWeaponTypesNotifier();
});

class ListOfWeaponTypesNotifier extends AppStateNotifier {
  final GraphQLClient _graphqlClient = client.value;
  List<WeaponType> _listOfWeaponTypes = [];
  List<String> _listOfWeaponTypesString = [];
  String _gunId = '';

  List<WeaponType> get listofWeaponTypes => _listOfWeaponTypes;
  List<String> get listOfWeaponTypesString => _listOfWeaponTypesString;
  String get gunId => _gunId;

  void setListOfWeaponTypesString({List<String> listOfWeaponTypesString}) {
    _listOfWeaponTypesString = listOfWeaponTypesString;
    notifyListeners();
  }

  void setGunId({String gunId}) {
    _gunId = gunId;
    notifyListeners();
  }

  Future getListOfWeaponTypes() async {
    setState(AppState.Loading);
    updateHasError(value: false);
    final QueryResult result = await _graphqlClient.query(
      QueryOptions(
        document: gql(getWeaponTypesQuery),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      updateHasError(value: true);
      return Text('No Data');
    } else {
      final List<dynamic> dataGuns = result.data['allGuns'] as List<dynamic>;
      _listOfWeaponTypes =
          dataGuns.map((item) => WeaponType.fromJson(item)).toList();
    }
    setState(AppState.Idle);
    notifyListeners();
  }
}
