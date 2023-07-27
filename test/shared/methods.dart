import 'package:test/test.dart';

isNovelEmpty(novel) {
  expect(novel.title, isNotEmpty);
  expect(novel.cover, isNotEmpty);
  expect(novel.url, isNotEmpty);
}
