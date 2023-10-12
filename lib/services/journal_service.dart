import 'package:http/http.dart' as http;

class JournalService {
  static const String url = "http://192.168.15.1:3000/";
  static const String resource = "learnhttp";

  Uri getUri() {
    return Uri.parse("$url$resource");
  }

  register(String content) {
    http.post(getUri(), body: {"content": content});
  }

  Future<String> get() async {
    http.Response response = await http.get(getUri());
    return response.body;
  }
}
