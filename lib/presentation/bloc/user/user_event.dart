part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
   final Usuario user;

  ActivateUser( this.user);
}

class ChangeAgeUser extends UserEvent {
  final int age;

  ChangeAgeUser( this.age);
}

class AddProfession extends UserEvent {
  final String profession;

  AddProfession( this.profession);
}

class DeleteUser extends UserEvent {
  
}