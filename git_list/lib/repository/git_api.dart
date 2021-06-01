import 'dart:convert';

import 'package:git_list/models/git_model.dart';
import 'package:http/http.dart';

/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {}

class GitApi {
  final baseUrl = "api.github.com";

  final Client _client;

  GitApi(this._client);

  Future<List<GitModel>> fetchAllRepositories(String query) async {
    final queryParam = {"q": query};
    final uri = Uri.https(baseUrl, "/search/repositories", queryParam);

    try {
      Response response = await _client.get(uri);
      final bodyMap = json.decode(response.body) as Map<String, dynamic>;
      final bodyList = bodyMap['items'] as List;
      return bodyList
          .map((item) => GitModel.parse(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      //todo: handle better the errors
      return [];
    }
  }
}
