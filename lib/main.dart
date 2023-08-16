import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_api_bloc/blocs/app_blocs.dart';
import 'package:users_api_bloc/blocs/app_events.dart';
import 'package:users_api_bloc/model/user_model.dart';
import 'package:users_api_bloc/repos/repositries.dart';

import 'blocs/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RepositoryProvider(
          create: (context) => UserRepositry(), child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepositry>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text('The Bloc App'),
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UserLoadedState) {
                List<UserModel> userList = state.users;
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(
                        userList[index].firstname,

                        style: TextStyle(color: Colors.white),
                      ),

                      subtitle: Text(
                        userList[index].lastname,
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(userList[index].avatar),
                      ),
                    );
                  },
                );

              }
              if (state is UserErrorState) {
                return Center(
                  child: Text('Error'),
                );
              }
              return Container();
            },
          )),
    );
  }
}
