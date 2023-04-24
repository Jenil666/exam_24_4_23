import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ToDOListProvider extends ChangeNotifier
{
  TextEditingController txtId = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtuserId = TextEditingController();
  TextEditingController txtuserPassword = TextEditingController();
  TextEditingController txttitle = TextEditingController();
  TextEditingController txttask = TextEditingController();
  TextEditingController txtupdatedtitle = TextEditingController();
  TextEditingController txtupdatedtask = TextEditingController();
  List todotitle = [];
  List todotask = [];
  List done = [];
  bool doneCheck = true;
  void refresh()
  {
    notifyListeners();
  }
}