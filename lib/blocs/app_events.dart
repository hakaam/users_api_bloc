import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


@immutable // immuatble means that after creating class we not able to change properties of this classes

abstract class UserEvent extends Equatable{
   const UserEvent();

}
//data loading state
class LoadUserEvent extends UserEvent{
  @override
  List<Object?> get props => [];



}

