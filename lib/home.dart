import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_bloc/detail.dart';
import 'package:flutter_learn_bloc/user_bloc/user_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    // with extensions
    context.read<UserBloc>().add(GetListUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn bloc flutter"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                getData();
              },
              child: ListView(
                children: state.users
                    .map(
                      (e) => ListTile(
                        title: Text(e.name),
                        subtitle: Text(e.email),
                        trailing: Image.network(e.avatar),
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => DetailUserPage(
                                id: e.id,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return const LinearProgressIndicator();
          }
        },
      ),
    );
  }
}
