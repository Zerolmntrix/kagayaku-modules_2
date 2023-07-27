import 'package:web_scraper/web_scraper.dart';

import '../models/novel.dart';

abstract class ModuleInterface {
  final WebScraper webScraper = WebScraper('example.com');

  GetNovel getPopularNovels();

  GetNovel getLatestNovels();

  GetNovel searchNovels(String query);
}
