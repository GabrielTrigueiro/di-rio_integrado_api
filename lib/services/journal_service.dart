import 'dart:convert';

import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class JournalService {
  static const String url = "http://192.168.15.39:3000/";
  static const String resource = "journals/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Uri getUri() {
    return Uri.parse("$url$resource");
  }

  Future<bool> register(Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());
    http.Response response = await client.post(
      getUri(),
      headers: {'Content-type': 'application/json'},
      body: jsonJournal,
    );
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<String> get() async {
    http.Response response = await client.get(getUri());
    return response.body;
  }

  //criando método de get all
  //o arquivo chega como um bloco de json, temos que traduzir ter nossa lista de journal
  Future<List<Journal>> getAll() async {
    http.Response response = await client.get(getUri());
    if (response.statusCode != 200) {
      throw Exception();
    }
    List<Journal> list = [];

    List<dynamic> listDynamic = json.decode(response.body);

    for (var jsonMap in listDynamic) {
      list.add(Journal.fromMap(jsonMap));
    }

    return list;
  }
}
