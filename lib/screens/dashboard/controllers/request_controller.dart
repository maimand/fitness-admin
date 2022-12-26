import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smart_admin_dashboard/services/data/models/user.model.dart';
import 'package:smart_admin_dashboard/services/data/repositories/log_repository.dart';

class RequestController extends GetxController {
  final LogRepository repository;
  RxList<UserModel> users = <UserModel>[].obs;

  RequestController(this.repository);

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  void getUsers() async {
    try {
      EasyLoading.show();
      final res = await repository.getInactiveUsers();
      users.assignAll(res);
    } on Exception catch (e) {
      Get.snackbar('Get User Error', e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  void acceptUser(UserModel user) async {
    try {
      await repository.acceptUser(user.email!);
      getUsers();
    } on Exception catch (e) {
      Get.snackbar('Accept User Error', e.toString());
    }
  }


}