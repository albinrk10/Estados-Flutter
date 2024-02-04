import 'package:get/get.dart';
import '../../domain/domain.dart';
export 'usuario_controller.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario  = Usuario().obs;

  get profesionesCount  {
    return usuario.value.profesiones.length;
  }

  void cargarUsuario( Usuario pUsuario){
    existeUsuario.value = true;
    usuario.value = pUsuario;
  } 

  void cambiarEdad(int edad){
    usuario.update((val) {
      val!.edad = edad;
    });
  }
  
  void cambiarProfesion(String profesion){
    usuario.update((val) {
      val!.profesiones = [...val.profesiones,profesion];
    });
  }


  


}
