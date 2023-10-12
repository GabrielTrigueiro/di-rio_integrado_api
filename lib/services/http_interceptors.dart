import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    logger.v("Resposta para ${data.baseUrl}\nCorpo: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode ~/ 100 == 2) {
      logger.i(
          "Requisição para ${data.url}\nStatus da Resposta:${data.statusCode}\nCorpo: ${data.headers}");
    } else {
      logger.e(
          "Requisição para ${data.url}\nStatus da Resposta:${data.statusCode}\nCorpo: ${data.body}");
    }
    return data;
  }
}
