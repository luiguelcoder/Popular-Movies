import 'dart:io';

Future<String> fixture(String name) async {
  var dir = Directory.current;
  while (
      !await dir.list().any((entity) => entity.path.endsWith('pubspec.yaml'))) {
    dir = dir.parent;
  }
  return File('${dir.path}/test/fixtures/$name').readAsStringSync();
}
