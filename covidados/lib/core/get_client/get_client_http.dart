abstract class GetClientHttp {
  Future<GetClientHttpResponse> get(String url);
  Future<GetClientHttpResponse> post(String url,
      {required Map<String, dynamic> body});
}

class GetClientHttpResponse {
  final dynamic data;
  final int? statusCode;

  GetClientHttpResponse({required this.data, this.statusCode});
}
