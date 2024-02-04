part of 'usuario_cubit.dart';

@immutable
sealed class UsuarioState {}

final class UsuarioInitial extends UsuarioState {
  final exiteUsuario = false;
}

final class UsuarioActivo extends UsuarioState {
  final exiteUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);
}
