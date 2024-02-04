
import 'package:estados_singleton/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({super.key});
 
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context,listen : false);
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
              final newUser= Usuario(
                nombre: 'Albin',
                edad: 27,
                profesiones: ['Ingeniero','Desarrollador']);
              // BlocProvider.of<UserBloc>(context,listen : false)
              // .add(ActivateUser(user: newUser));
              userBloc.add(ActivateUser( newUser));

            },
            child: const Text('Establecer Usuario',style: TextStyle(color: Colors.white),)),

            MaterialButton(
            color: Colors.blue,
            onPressed: () {
              // BlocProvider.of<UserBloc>(context,listen : false)
              // .add(ChangeAgeUser(age: 30));
              userBloc.add(ChangeAgeUser( 30));
            },
            child: const Text('Cambiar de Edad',style: TextStyle(color: Colors.white),)),

            MaterialButton(
            color: Colors.blue,
            onPressed: () {
              // BlocProvider.of<UserBloc>(context,listen : false)
              // .add(AddProfession(profession: 'Carpintero'));
              userBloc.add(AddProfession('Nueva Profecion' ));
            },
            child: const Text('Añadir Profecion',style: TextStyle(color: Colors.white),)),
          ],
        )
      ),
    );
  }
}