import 'package:web_scraper/web_scraper.dart';

import '../../../interface/module.dart';
import '../../../models/novel.dart';

getPopularNovels() => AnimeCenterBr().getPopularNovels();
getLatestNovels() => AnimeCenterBr().getLatestNovels();
searchNovels(query) => AnimeCenterBr().searchNovels(query);

class AnimeCenterBr implements ModuleInterface {
  @override
  final webScraper = WebScraper('https://animecenterbr.com/');

  @override
  getPopularNovels() async {
    List<NovelModel> novels = [];

    if (await webScraper.loadWebPage('/light-novels/')) {
      List<Map<String, dynamic>> titles = webScraper
          .getElement('.container-general .card-custom h5 a', ['href']);
      List<Map<String, dynamic>> covers = webScraper.getElement(
          '.container-general .card-custom .img__wrap img', ['src']);

      for (int i = 0; i < titles.length; i++) {
        novels.add(NovelModel(
            title: titles[i]['title'],
            cover: covers[i]['attributes']['src'].substring(
              0,
              covers[i]['attributes']['src'].toString().indexOf("?resize="),
            ),
            url: titles[i]['attributes']['href']));
      }
    }

    return novels;
  }

  @override
  getLatestNovels() async {
    return [];
  }

  @override
  searchNovels(query) async {
    List<NovelModel> novels = [];

    if (await webScraper.loadWebPage('/light-novels-2/')) {
      List<Map<String, dynamic>> titles =
          webScraper.getElement('#loadfade > main ul a', ['href']);
      List<Map<String, dynamic>> covers =
          webScraper.getElement('#loadfade main img', ['src']);

      for (int i = 0; i < titles.length; i++) {
        novels.add(NovelModel(
            title: titles[i]['title'],
            cover: covers[i]['attributes']['src'].substring(
              0,
              covers[i]['attributes']['src'].toString().indexOf("?resize="),
            ),
            url: titles[i]['attributes']['href']));
      }
    }

    return novels
        .where((novel) => query.split(" ").any(
            (word) => novel.title.toLowerCase().contains(word.toLowerCase())))
        .toList();
  }
}
