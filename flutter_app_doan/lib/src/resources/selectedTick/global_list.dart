import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalList {
  static List<Map<String, dynamic>> thucAnDaChon=[];
  static List<Map<String, dynamic>> tapLuyenDaChon=[];

  static void setUpdateTime() async {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String timeFormat=dateFormat.format(DateTime.now());
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setString('updateTime', timeFormat);
  }

  static Future<String> getUpdateTime() async {
    // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    // String timeFormat=dateFormat.format(DateTime.now());
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String time = prefs.getString('updateTime');
    return time;
  }
}