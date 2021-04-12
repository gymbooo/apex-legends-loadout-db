import 'package:apex_weapons/grapql/queries.dart';
import 'package:apex_weapons/helpers/enums.dart';
import 'package:apex_weapons/helpers/graphql.dart';
import 'package:apex_weapons/models/models.dart';
import 'package:apex_weapons/providers/providers.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final listOfFireModeCNP = ChangeNotifierProvider<ListOfFireModeNotifier>((ref) {
  return ListOfFireModeNotifier();
});

class ListOfFireModeNotifier extends AppStateNotifier {
  final GraphQLClient _graphqlClient = client.value;
  List<FireMode> _listOfFireMode = [];
  List<String> _listOfFireModeString = [];

  List<FireMode> get listOfFireMode => _listOfFireMode;
  List<String> get listOfFireModeString => _listOfFireModeString;

  void setListOfFireModeString({List<String> listOfListOfFireModeString}) {
    _listOfFireModeString = listOfListOfFireModeString;
    notifyListeners();
  }

  Future getListOfFireMode() async {
    setState(AppState.Loading);
    updateHasError(value: false);
    final QueryResult result = await _graphqlClient.query(
      QueryOptions(
        document: gql(getFireModesQuery),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      updateHasError(value: true);
      return Text('No Data');
    } else {}
    final List<dynamic> dataGuns = result.data['allFireModes'] as List<dynamic>;
    _listOfFireMode = dataGuns.map((item) => FireMode.fromJson(item)).toList();
    setState(AppState.Idle);
    notifyListeners();
  }
}
