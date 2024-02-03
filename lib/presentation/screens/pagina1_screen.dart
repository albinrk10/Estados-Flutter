import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page 1'),
        ),
        body: const InformacionUsuario(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          onPressed: () => context.push('/page2'),
        ));
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Usuario:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(title: Text('Nombre:')),
          ListTile(title: Text('Edad:')),
          Text(
            'Profesiones:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(title: Text('Profesion 1:')),
          ListTile(title: Text('Profesion 2:')),
          ListTile(title: Text('Profesion 3:')),
        ],
      ),
    );
  }
}
