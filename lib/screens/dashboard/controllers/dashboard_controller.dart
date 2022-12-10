import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smart_admin_dashboard/services/data/models/user.model.dart';
import 'package:smart_admin_dashboard/services/data/repositories/log_repository.dart';

class DashboardController extends GetxController {
  final LogRepository repository;
  RxList<UserModel> users = <UserModel>[].obs;

  DashboardController(this.repository);

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  void getUsers() async {
    try {
      EasyLoading.show();
      final res = await repository.getUsers();
      users.assignAll(res);
    } on Exception catch (e) {
      Get.snackbar('Get User Error', e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  void deleteUser(UserModel user) {
    try {
      repository.deleteUser(user.email!);
    } on Exception catch (e) {
      Get.snackbar('Delete User Error', e.toString());
    }
  }

  void resetUserPassword(UserModel user) {
    try {
      repository.resetUserPassword(user.email!);
    } on Exception catch (e) {
      Get.snackbar('Delete User Error', e.toString());
    }
  }


}