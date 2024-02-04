import 'package:bloc/bloc.dart';
import 'package:estados_singleton/domain/domain.dart';
import 'package:meta/meta.dart';
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario usuario) {
    emit(UsuarioActivo(usuario));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final usuario = currentState.usuario.copyWith(edad: 30);
      emit(UsuarioActivo(usuario));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      // currentState.usuario
      final newProfesiones = [
        ...currentState.usuario.profesiones,
        'Profesión ${currentState.usuario.profesiones.length + 1}'
      ];
      final newUser =
          currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }
  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
