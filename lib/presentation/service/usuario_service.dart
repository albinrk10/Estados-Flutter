import 'dart:async';

import 'package:flutter/material.dart';
import '../../domain/domain.dart';

class _UsuarioService with ChangeNotifier {
  Usuario? _usuario;

  StreamController<Usuario> _usuarioStreamController = StreamController<Usuario>.broadcast();

  Usuario? get usuario => _usuario;

  bool get existeUsuario => (_usuario != null) ? true : false;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario user) {
    _usuario = user;
    _usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    _usuario?.edad = edad;
    _usuarioStreamController.add(usuario!);
  }
  
  @override
  void dispose() {
    _usuarioStreamController?.close();
    super.dispose();
  }
}

final usuarioService = _UsuarioService();
