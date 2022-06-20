import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class OngsData {
  static final OngsData _singleton = OngsData._internal();

  factory OngsData() {
    return _singleton;
  }

  OngsData._internal();

  static Future getJson() async {
    return json.decode(await rootBundle.loadString('assets/data/ong_infos.json')) as Map;
  }
}