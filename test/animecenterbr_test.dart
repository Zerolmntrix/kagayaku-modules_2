// File for tests
import 'package:test/test.dart';

import '../src/modules/pt/animecenterbr/module.dart';
import 'shared/methods.dart';

void main() {
  final animecenter = AnimeCenterBr();
  group('AnimeCenterBr', () {
    group('Lists', () {
      test('Popular', () async {
        final novels = await animecenter.getPopularNovels();

        expect(novels, isNotEmpty);
        isNovelEmpty(novels[0]);
      });

      test('Search', () async {
        final novels = await animecenter.searchNovels("Ac");

        expect(novels, isNotEmpty);
        isNovelEmpty(novels[0]);
        expect(novels[0].title, contains("Ac"));
      });
    });
  });
}
