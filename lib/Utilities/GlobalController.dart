
import 'dart:convert';

import 'package:http/http.dart';

import 'Strings.dart';

abstract class GlobalController{

  // ignore: non_constant_identifier_names
  Future<Response> HttpPost(String api , Map body) async{
  var url = Uri.parse("$serverURL$api");
  return await post(url,   headers: {"Content-Type": "application/json"},  body: jsonEncode(body));
}


  Future<Response> HttpGet(String api , {Map<String , String>? header}) async{
  var url = Uri.parse("$serverURL$api");
  return await get(url,   headers: header);
}
}