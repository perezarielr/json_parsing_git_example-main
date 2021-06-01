import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_list/cubit/home_cubit.dart';
import 'package:git_list/cubit/home_state.dart';
import 'package:git_list/repository/home_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(repository: context.read<HomeRepository>())
        ..fetchRepositories("android"), //initial query
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _HomeBody(),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select((HomeCubit cubit) => cubit.state.status);

    switch (status) {
      case HomeStatus.initial:
        return const SizedBox(key: Key("homeView_initial"));
      case HomeStatus.loading:
        return const Center(
          key: Key("homeView_loading"),
          child: CircularProgressIndicator.adaptive(),
        );
      case HomeStatus.success:
        return const _GitList(key: Key("homeView_success"));
      case HomeStatus.failure:
        return const Center(
          key: Key("homeView_failure"),
          child: Text("Error"),
        );
    }
  }
}

class _GitList extends StatelessWidget {
  const _GitList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repositories =
        context.select((HomeCubit cubit) => cubit.state.models!);

    return ListView(
      children: [
        for (final repo in repositories) ...[
          ListTile(
            isThreeLine: true,
            onTap: () {
              // add Navigation
            },
            title: Text(repo.fullName),
            subtitle: Text(
              repo.description ?? "-",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.chevron_right_sharp),
          ),
          const Divider(),
        ]
      ],
    );
  }
}
