import 'package:exam_24_4_23/projects/api_calling/modal/api_modal.dart';
import 'package:exam_24_4_23/utils/api_helper.dart';
import 'package:flutter/cupertino.dart';

class ApiProvider extends ChangeNotifier
{
  Future<Corona> coronaApiCalling()
  async {
    ApiHelper api = ApiHelper();
    Corona data = await api.coronaGetApi();
    return data;
  }
}