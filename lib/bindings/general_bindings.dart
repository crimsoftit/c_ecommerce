import 'package:duara_ecommerce/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class CGeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CNetworkManager());
  }
}
