import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/domain.dart';
import '../bloc/bloc.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page 1'),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<UsuarioCubit>().borrarUsuario();
                // context.go('/');
              },
            )
          ],
        ),
        body: const BodyScaffold(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          onPressed: () => context.push('/page2'),
        ));
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (context, state) {
        //con switch
        switch (state.runtimeType) {
          case UsuarioInitial:
            return const Center(child: Text('No hay información del usuario'));

          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usuario);

          default:
            return const Center(child: Text('Estado no reconocido '));
        }
        //con if else if
        // if (state is UsuarioInitial) {
        //   return const Center(child: Text('No hay usuario'));
        // } else if(state is UsuarioActivo) {
        //   return  InformacionUsuario( state.usuario);
        // }else {
        //   return const Center( child: Text('Estado no reconocido '));
        // }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario(this.usuario, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Usuario:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre} ')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          const Text(
            'Profesiones:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...usuario.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList()
        ],
      ),
    );
  }
}
