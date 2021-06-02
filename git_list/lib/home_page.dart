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
      backgroundColor: Colors.black,
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
           // isThreeLine: true,
            onTap: () {
              // add Navigation
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(repo.avatarUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      repo.fullName,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      repo.description ?? "-",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: EdgeInsets.all(5),
                        width: 55,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[850],
                        ),
                        child: Text(
                          '${repo.watchersCount}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[200]),
                        ),
                        padding: EdgeInsets.all(8)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        repo.updatedAt,
                        style: TextStyle(fontSize: 14, color: Colors.grey[200]),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ],
                )),
              ],
            ),
            //title: Text(repo.fullName),
            //subtitle: Text(
            //repo.description ?? "-",
            //maxLines: 2,
            //overflow: TextOverflow.ellipsis,
            //),
            //trailing: const Icon(Icons.chevron_right_sharp),
            //),
            //const Divider(),
            //]
            //],
          ),
        ]
      ],
    );
  }
}
