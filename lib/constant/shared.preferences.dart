import 'package:shared_preferences/shared_preferences.dart';

class MySP {
  static Future<int> getIdSV() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var idND = prefs.getInt("id");
    return idND ?? 0;
  }
}
