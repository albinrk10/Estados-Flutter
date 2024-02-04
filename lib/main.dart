import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'config/config.dart';
import 'presentation/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: AppTheme(selectedColor: 1).theme(),
        title: 'Material App',
        initialRoute: '/pagina1',
        // routes: {
        //   'pagina1': ( _ ) => const Page1Screen(),
        //   'pagina2': ( _ ) => const Page2Screen(),
        // },
        getPages: [
          GetPage(name: '/pagina1', page: () => const Page1Screen()),
          GetPage(name: '/pagina2', page: () => const Page2Screen()),
        ]
      );
  }
}

     