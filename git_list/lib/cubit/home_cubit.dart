import 'package:bloc/bloc.dart';
import 'package:git_list/cubit/home_state.dart';
import 'package:git_list/repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;

  HomeCubit({required HomeRepository repository})
      : _repository = repository,
        super(const HomeState());

  Future<void> fetchRepositories(String query) async {
    emit(HomeState(
      status: HomeStatus.loading,
      models: state.models,
    ));

    try {
      final gits = await _repository.fetchRepositories(query);
      emit(HomeState(
        status: HomeStatus.success,
        models: gits,
      ));
    } on Exception {
      emit(HomeState(
        status: HomeStatus.failure,
        models: state.models,
      ));
    }
  }
}
