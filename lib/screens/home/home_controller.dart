import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentPage = 0.obs;

  void setPage(int index) {
    currentPage.value = index;
  }
}