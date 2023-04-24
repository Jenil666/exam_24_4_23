import 'dart:convert';

import 'package:exam_24_4_23/projects/api_calling/modal/api_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  Future<Corona> coronaGetApi()
  async {
    Uri link = Uri.parse("https://corona-virus-world-and-india-data.p.rapidapi.com/api");
    var data = await http.get(link,headers: {"X-RapidAPI-Key":"8c97d5c454msh72a9a81f9fe0357p12be3cjsn6fd2c887d5d0","X-RapidAPI-Host":"corona-virus-world-and-india-data.p.rapidapi.com"});
    var json = jsonDecode(data.body);
    Corona jsonData = Corona.fromJson(json);
    return jsonData;
  }
}