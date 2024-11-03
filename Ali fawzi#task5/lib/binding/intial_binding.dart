import 'package:get/get.dart';


import '../Core/class/Curd.dart';
import '../Core/network_connection/network_connection.dart';




class InitialBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(Crud());
    Get.put(NetworkManager());

  }


}