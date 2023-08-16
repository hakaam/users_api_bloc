import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model/user_model.dart';

@immutable // immuatble means that after creating class we not able to change properties of this classes
abstract class UserState extends Equatable {}

//data loading state
class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

//data loaded state
class UserLoadedState extends UserState {
  UserLoadedState(this.users);
  final List<UserModel> users;

  @override
  List<Object?> get props => [users];
}

//data error loading state
class UserErrorState extends UserState {
  UserErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
