import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_list/home_page.dart';
import 'package:git_list/repository/git_api.dart';
import 'package:git_list/repository/home_repository.dart';
import 'package:http/http.dart';

void main() {
  runApp(
    MyApp(
      repository: HomeRepository(
        GitApi(Client()),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final HomeRepository _repository;

  const MyApp({Key? key, required HomeRepository repository})
      : _repository = repository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: _repository)],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
