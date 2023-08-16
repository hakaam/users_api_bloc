import 'package:users_api_bloc/blocs/app_events.dart';
import 'package:users_api_bloc/blocs/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_api_bloc/repos/repositries.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepositry _userRepositry;

  UserBloc(this._userRepositry) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final users = await _userRepositry.getUsers();

        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));

      }
    });
  }
}
