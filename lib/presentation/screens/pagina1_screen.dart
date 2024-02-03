import 'package:estados_singleton/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../domain/domain.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page 1'),
          actions: [
            usuarioProvider.existeUsuario
             ? IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                usuarioProvider.removerUsuario();
              },
            )
            //nuul
            : const SizedBox(),
            
            
          ],
        ),
        body: usuarioProvider.existeUsuario
            ?  InformacionUsuario( usuarioProvider.usuario!)
            : const Center(
                child: Text('No hay usuario seleccionado'),
              ), 
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          onPressed: () => context.push('/page2'),
        ));
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario? usuario;

  const InformacionUsuario(this.usuario, {super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Usuario:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(title: Text('Nombre:${usuario!.nombre}')),
          ListTile(title: Text('Edad: ${usuario!.edad}')),
          const Text(
            'Profesiones:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...usuario!.profesiones.map((profesion) => ListTile(title: Text(profesion))).toList(),
          // const ListTile(title: Text('Profesion 1:')),
         
        ],
      ),
    );
  }
}
