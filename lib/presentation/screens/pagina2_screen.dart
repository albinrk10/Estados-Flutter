import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/domain.dart';
import '../bloc/bloc.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({super.key});
 
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           MaterialButton(
            color: Colors.blue,
            onPressed: () {
              final usuario = Usuario(
                nombre: 'Albin',
                edad: 27,
                profesiones: ['Ingeniero', 'Desarrollador']
              );
              usuarioCubit.seleccionarUsuario(usuario);
            },
            child: const Text('Establecer Usuario',style: TextStyle(color: Colors.white),)),

            MaterialButton(
            color: Colors.blue,
            onPressed: () {
              usuarioCubit.cambiarEdad(30);
            },
            child: const Text('Cambiar de Edad',style: TextStyle(color: Colors.white),)),

            MaterialButton(
            color: Colors.blue,
            onPressed: () {
               usuarioCubit.agregarProfesion();
            },
            child: const Text('Añadir Profecion',style: TextStyle(color: Colors.white),)),
          ],
        )
      ),
    );
  }
}