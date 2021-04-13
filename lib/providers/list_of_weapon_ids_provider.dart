import 'package:apex_weapons/grapql/queries.dart';
import 'package:apex_weapons/helpers/enums.dart';
import 'package:apex_weapons/helpers/graphql.dart';
import 'package:apex_weapons/models/models.dart';
import 'package:apex_weapons/providers/providers.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final listOfWeaponIdsCNP =
    ChangeNotifierProvider<ListOfWeaponIdsNotifier>((ref) {
  return ListOfWeaponIdsNotifier();
});

class ListOfWeaponIdsNotifier extends AppStateNotifier {
  final GraphQLClient _graphqlClient = client.value;
  List<WeaponId> _listOfWeaponIds = [];

  List<WeaponId> get listOfWeaponIds => _listOfWeaponIds;

  Future getListOfWeaponIds() async {
    setState(AppState.Loading);
    updateHasError(value: false);
    final QueryResult result = await _graphqlClient.query(
      QueryOptions(
        document: gql(getWeaponIdsQuery),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      updateHasError(value: true);
      return Text('No Data');
    } else {}
    final List<dynamic> dataGuns = result.data['allWeapons'] as List<dynamic>;
    _listOfWeaponIds = dataGuns.map((item) => WeaponId.fromJson(item)).toList();
    setState(AppState.Idle);
    notifyListeners();
  }
}
