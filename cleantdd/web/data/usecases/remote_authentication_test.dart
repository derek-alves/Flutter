// import 'package:faker/faker.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class RemoteAuthentication {
//   final HttpClient httpClient;
//   final String url;
//   RemoteAuthentication({
//     required this.httpClient,
//     required this.url,
//   });
//   Future<void> auth() async {}
// }

// abstract class HttpClient {
//   Future<void> request({required String url});
// }

// void main() {
//   test("should call HttpClient with correct URL", () async {
//     final httpClient = HttpClient();
//     final url = faker.internet.httpUrl();
//     final sut = RemoteAuthentication(httpClient: httpClient, url: url);

//     await sut.auth();

//     verify(httpClient.request(url: url));
//   });
// }
