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
                 BlocProvider.of<UserBloc>(context).add( DeleteUser() );
                // context.go('/');
              },
            ),
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
           return state.exitUser
              ?   InformacionUsuario(user: state.user!,)
              : const Center(child: Text('No hay usuario activo'));
          }
        ),
        
        // const InformacionUsuario(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          onPressed: () => context.push('/page2'),
        ));
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario user;

  const InformacionUsuario({super.key, required this.user});
  
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
          ListTile(title: Text('Nombre:  ${user.nombre}')),
          ListTile(title: Text('Edad: ${user.edad}')),
          const Text(
            'Profesiones:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...user.profesiones.map(
            (profesion) => ListTile(title: Text(profesion))
            ).toList(),
         
        ],
      ),
    );
  }
}
