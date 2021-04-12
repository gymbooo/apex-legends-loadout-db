import 'package:apex_weapons/helpers/graphql.dart';
import 'package:apex_weapons/routing/router.dart';
import 'package:apex_weapons/themes/color.dart';
import 'package:apex_weapons/widgets/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(
    GraphQLProvider(
      client: client,
      child: ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      title: 'Apex Legends Weapon DB',
      theme: ThemeData(
        primaryColor: black,
      ),
      home: MyHomePage(),
      onGenerateRoute: generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutWidget();
  }
}
