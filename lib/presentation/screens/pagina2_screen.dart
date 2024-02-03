import 'package:estados_singleton/domain/domain.dart';
import 'package:estados_singleton/presentation/service/service.dart';
import 'package:flutter/material.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  StreamBuilder(
            stream: usuarioService.usuarioStream,
            builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
              return snapshot.hasData
                  ? Text('Nombre - ${snapshot.data!.nombre}')
                  : const Text('Page 2');
            })
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                 final nuevoUsuario = Usuario(nombre: 'Albin', edad: 27);
                  usuarioService.cargarUsuario(nuevoUsuario);
                print(usuarioService.cargarUsuario);
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(30);
              },
              child: const Text(
                'Cambiar de Edad',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text(
                'Añadir Profecion',
                style: TextStyle(color: Colors.white),
              )),
        ],
      )),
    );
  }
}
