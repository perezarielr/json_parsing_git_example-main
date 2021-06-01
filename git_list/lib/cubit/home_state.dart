// part of 'home_cubit.dart';

import 'package:git_list/models/git_model.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState {
  final HomeStatus status;
  final List<GitModel>? models;

  const HomeState({
    this.status = HomeStatus.initial,
    this.models,
  });
}
