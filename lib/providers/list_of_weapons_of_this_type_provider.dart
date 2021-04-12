import 'package:apex_weapons/grapql/queries.dart';
import 'package:apex_weapons/helpers/enums.dart';
import 'package:apex_weapons/helpers/graphql.dart';
import 'package:apex_weapons/models/models.dart';
import 'package:apex_weapons/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final listOfWeaponsOfThisTypeCNP =
    ChangeNotifierProvider<ListOfWeaponsOfThisType>((ref) {
  return ListOfWeaponsOfThisType();
});

class ListOfWeaponsOfThisType extends AppStateNotifier {
  String _weaponType = '';
  List<Weapon> _listOfWeaponsOfThisType = [];
  final GraphQLClient _graphqlClient = client.value;

  List<Weapon> get listOfWeaponsOfThisType => _listOfWeaponsOfThisType;
  String get weaponTypeName => _weaponType;

  void clearAll() {
    _listOfWeaponsOfThisType = [];
    _weaponType = '';
    notifyListeners();
  }

  Future getWeaponsOfThisType({String id}) async {
    setState(AppState.Loading);
    updateHasError(value: false);
    final QueryResult result = await _graphqlClient.query(
      QueryOptions(
        document: gql(getWeaponsOfThisTypeQuery),
        fetchPolicy: FetchPolicy.noCache,
        variables: {
          'id': id,
        },
      ),
    );

    if (result.hasException) {
      updateHasError(value: true);
      return Text('No Data');
    } else {
      _weaponType = result.data['Gun']['gun_type'];
      final List<dynamic> dataGuns =
          result.data['Gun']['Weapons'] as List<dynamic>;
      _listOfWeaponsOfThisType =
          dataGuns.map((item) => Weapon.fromJson(item)).toList();
    }
    setState(AppState.Idle);
    notifyListeners();
  }
}
