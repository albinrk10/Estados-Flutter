import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/domain.dart';
import '../controllers/controllers.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // print(Get.arguments['edad']);
    final usuarioCtrl = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cargarUsuario(Usuario(
                  nombre: 'Albin',
                  edad: 27,
                  // profesion: 'Desarrollador',
                ));
                Get.snackbar(
                    'Usuario Establecido', 'Albin es el nombre del usuario ',
                    backgroundColor: Colors.white,
                    boxShadows: [
                      const BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10.0,
                      )
                    ]);
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(30);
              },
              child: const Text(
                'Cambiar de Edad',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                // usuarioCtrl.cambiarProfesion('Profesion #${usuarioCtrl.usuario.value.profesiones.length+1}');
                usuarioCtrl.cambiarProfesion(
                    'Profesion #${usuarioCtrl.profesionesCount + 1}');
              },
              child: const Text(
                'Añadir Profecion',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                // usuarioCtrl.cambiarProfesion('Profesion #${usuarioCtrl.usuario.value.profesiones.length+1}');
                Get.changeTheme(Get.isDarkMode? ThemeData.light() : ThemeData.dark());
              },
              child: const Text(
                'Cambiar tema',
                style: TextStyle(color: Colors.white),
              )),
        ],
      )),
    );
  }
}
