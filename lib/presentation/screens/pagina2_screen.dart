import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/domain.dart';
import '../providers/providers.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioProvider =
                    Provider.of<UsuarioProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:  usuarioProvider.existeUsuario
            ? Text('Nombre: ${usuarioProvider.usuario!.nombre}')
            : const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                 
                final newUser = Usuario(nombre: 'Albin', edad: 27, profesiones: [
                  'Ingeniero',
                  'Desarrollador',
                  
                ]);
                usuarioProvider.usuario = newUser;
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
               
                usuarioProvider.cambiarEdad(30);     
              },
              child: const Text(
                'Cambiar de Edad',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioProvider.agregarProfesion();
              },
              child: const Text(
                'Añadir Profecion',
                style: TextStyle(color: Colors.white),
              )),
        ],
      )),
    );
  }
}
