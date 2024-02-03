import 'package:flutter/material.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({super.key});

  @override
  Widget build(BuildContext context) {
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
              
            },
            child: const Text('Establecer Usuario',style: TextStyle(color: Colors.white),)),

            MaterialButton(
            color: Colors.blue,
            onPressed: () {
              
            },
            child: const Text('Cambiar de Edad',style: TextStyle(color: Colors.white),)),

            MaterialButton(
            color: Colors.blue,
            onPressed: () {
              
            },
            child: const Text('Añadir Profecion',style: TextStyle(color: Colors.white),)),
          ],
        )
      ),
    );
  }
}