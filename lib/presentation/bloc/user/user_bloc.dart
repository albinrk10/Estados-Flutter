import 'package:bloc/bloc.dart';
import 'package:estados_singleton/domain/domain.dart';
import 'package:meta/meta.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user))
    );

    on<ChangeAgeUser>((event, emit) {
     
      if (!state.exitUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));

    });
    on<AddProfession>((event, emit) {
      if (!state.exitUser) return;
      final professions = [...state.user!.profesiones, event.profession];
     emit(UserSetState(state.user!.copyWith(profesiones: professions)));
    });
    
    on<DeleteUser>((event, emit) => emit(const UserInitialState()));
  }
}
