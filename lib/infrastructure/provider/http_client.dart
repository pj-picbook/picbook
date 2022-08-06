import 'package:http/http.dart' as http;

class HttpClientResponse {
  HttpClientResponse({
    this.isParameterError = false,
    this.parameterErrorMessage = '',
    this.response,
  });

  bool isParameterError;
  String parameterErrorMessage;
  http.Response? response;
}

enum RequestType {
  post,
  get,
}

class HttpClient {
  HttpClient({
    required this.uri,
  });
  late Uri uri;
  final HttpClientResponse _httpClientResponse = HttpClientResponse();

  Future<HttpClientResponse> connect({required RequestType type}) async {
    try {
      _check();
      if (_httpClientResponse.isParameterError) return _httpClientResponse;
      switch (type) {
        case RequestType.get:
          _httpClientResponse.response = await http.get(uri);
          break;
        case RequestType.post:
          _httpClientResponse.response = await http.get(uri);
          break;
      }
    } catch (e) {
      throw Exception(e);
    }
    return _httpClientResponse;
  }

  void _check() {
    _reset();
    _checkParameterError();
  }

  void _checkParameterError() {
    if (!uri.hasAuthority) {
      _httpClientResponse.isParameterError = true;
      _httpClientResponse.parameterErrorMessage = 'Error:authority Empty';
      return;
    }

    if (uri.hasEmptyPath) {
      _httpClientResponse.isParameterError = true;
      _httpClientResponse.parameterErrorMessage = 'Error: Path Empty ';
      return;
    }

    if (!uri.hasAbsolutePath) {
      _httpClientResponse.isParameterError = true;
      _httpClientResponse.parameterErrorMessage = 'Error: AbsolutePath Empty ';
      return;
    }
  }

  void _reset() {
    _httpClientResponse.isParameterError = false;
    _httpClientResponse.parameterErrorMessage = '';
    _httpClientResponse.response = null;
  }
}
