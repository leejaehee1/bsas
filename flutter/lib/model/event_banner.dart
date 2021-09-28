
import 'dart:html';

import 'package:bsas/db/event_day_db.dart';
import 'package:http/http.dart' as http;

class EventBanner {
  BannerDb _eventBanner = BannerDb();

  getEventBanner() async {
    return await _eventBanner.httpGet('api');
  }
}