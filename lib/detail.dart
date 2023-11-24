import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_bloc/detail_bloc/detail_bloc.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({super.key, required this.id});

  final int id;

  @override
  State<DetailUserPage> createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    context.read<DetailBloc>().add(GetDetailUserEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail User"),
      ),
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state.status == DetailStateStatus.success) {
            return Center(
              child: Column(
                children: [
                  Image.network(state.user!.avatar),
                  Text(state.user?.name ?? "No Name"),
                  Text(state.user?.email ?? "No Email"),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

      //bloc consumer
      // body: BlocConsumer<DetailBloc, DetailState>(
      //   listener: (context, state) {
      //     if (state.status == DetailStateStatus.loading) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(
      //           content: Text("Loading"),
      //         ),
      //       );
      //     }
      //   },
      //   builder: (context, state) {
      //     return const Center(
      //       child: Column(
      //         children: [
      //           //Image.network(src),
      //           Text("nama"),
      //           Text("email"),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
