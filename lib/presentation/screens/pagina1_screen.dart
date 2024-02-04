
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/domain.dart';
import '../controllers/controllers.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({super.key});

  @override
  Widget build(BuildContext context) {

   final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Page 1'),
        ),
        body: Obx(() => usuarioCtrl.existeUsuario.value
            ?  InformacionUsuario( usuario: usuarioCtrl.usuario.value,)
            : const NoInfo()),
        // const InformacionUsuario(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          // onPressed: () => context.push('/page2'), //go router
          // Navigator.pushNamed(context, 'pagina2'), //nativa
          // Get.to(const Page2Screen()), //get
          onPressed: () => Get.toNamed('pagina2',arguments: {
            'nombre':'Albin', //no era necesario solo para probar
            'edad': 27, //no era necesario solo para probar
            
          })
        ));
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay informacion'),
    );
  }
}
class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Usuario:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          const Text(
            'Profesiones:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...usuario.profesiones.map((profesion) => ListTile(title: Text(profesion))).toList(),

          // ListTile(title: Text('Profesion 1:')),
          // ListTile(title: Text('Profesion 2:')),
          // ListTile(title: Text('Profesion 3:')),
        ],
      ),
    );
  }
}
