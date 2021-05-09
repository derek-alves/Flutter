import 'package:get/get_connect/connect.dart';

class GetClientHttp extends GetConnect {
  @override
  Future<Response<T>> get<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder});
}
