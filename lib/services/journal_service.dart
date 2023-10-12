import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class JournalService {
  static const String url = "http://192.168.15.1:3000/";
  static const String resource = "learnhttp";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Uri getUri() {
    return Uri.parse("$url$resource");
  }

  register(String content) {
    client.post(getUri(), body: {"content": content});
  }

  Future<String> get() async {
    http.Response response = await client.get(getUri());
    return response.body;
  }
}
