abstract class BaseApiClient {
  Future<dynamic> apiGet(
    String url, {
    Map<String, dynamic> headers = const <String, dynamic>{},
  });
  Future<dynamic> apiPost(
    String url, {
    required dynamic body,
    Map<String, dynamic> headers = const <String, dynamic>{},
  });
}
