import 'package:get/get.dart';
import 'package:getx_use_api/api_modal/modal.dart';
import 'package:getx_use_api/api_service/service.dart';

class HomeScreenController extends GetxController {
  bool loader = true;
  late List<ProductsModel> _products;

  List<ProductsModel> get products => _products;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    _products = await Apiservice.getUser();
    if (products != null) {
      loader = false;
      update();
    }
  }
}
