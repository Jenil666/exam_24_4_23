import 'package:shared_preferences/shared_preferences.dart';

class Shr
{
  Future<void> setData(String id,String passwors,bool check) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setString("id",id);
    shr.setString("passwors",passwors);
  }

  Future<Map> readData()
  async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    String? email = shr.getString("id");
    String? password = shr.getString("passwors");
    Map m1 = {"e1":email,"p1":password};
    return m1;
  }
}