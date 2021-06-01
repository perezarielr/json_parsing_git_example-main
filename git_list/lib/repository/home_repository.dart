import 'package:git_list/repository/git_api.dart';
import 'package:git_list/models/git_model.dart';

class HomeRepository {
  final GitApi _api;

  HomeRepository(this._api);

  Future<List<GitModel>> fetchRepositories(String query) async {
    return await _api.fetchAllRepositories(query);
  }
}
