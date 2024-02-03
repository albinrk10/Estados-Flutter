import 'package:flutter/material.dart';
import '../../domain/domain.dart';

class UsuarioProvider with ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  bool get existeUsuario => (_usuario != null) ? true : false;

  set usuario(Usuario? usuario) {
    _usuario = usuario;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario?.edad = edad;
      notifyListeners();
    
  }

  void removerUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario?.profesiones.add('Profesion ${ _usuario!.profesiones.length + 1 }');
    notifyListeners();
  }

  }


