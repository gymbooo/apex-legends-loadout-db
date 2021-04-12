import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final _variables = ['GRAPHQL_URL'];

  final config = {
    for (var variable in _variables)
      variable: Platform.environment[variable] ?? '',
  };

  const filename = 'lib/helpers/app_config.dart';

  if (FileSystemEntity.typeSync(filename) == FileSystemEntityType.notFound) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    File(filename).writeAsString(
      '// ignore_for_file: prefer_single_quotes\n\nfinal config = ${encoder.convert(config)};\n',
    );
  }
}
