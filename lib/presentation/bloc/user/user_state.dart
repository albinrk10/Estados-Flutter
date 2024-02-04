part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool exitUser;
  final Usuario? user;

  const UserState({this.exitUser = false, this.user});
}

class UserInitialState extends UserState {
  const UserInitialState():super(exitUser: false, user: null);
  
}

class UserSetState extends UserState {
 final Usuario newUser;
  const UserSetState(this.newUser)
  :super(exitUser: true, user: newUser);

}
