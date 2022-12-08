import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_admin_dashboard/screens/home/home_screen.dart';
import 'package:smart_admin_dashboard/screens/login/login_screen.dart';
import 'package:smart_admin_dashboard/services/data/models/user.model.dart';
import 'package:smart_admin_dashboard/services/data/repositories/auth_repository.dart';

class AuthService extends GetxService {
  final AuthRepository authRepository;

  Rxn<AdminModel> userModel = Rxn();

  AuthService(this.authRepository);

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }

  void onLogin(String username, String password) async {
    try {
      EasyLoading.show();
      final res = await authRepository.login(username, password);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', res.accessToken!);
      getUserInfo();
    } on Exception catch (e) {
      Get.snackbar(
        'Login Error',
        e.toString(),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  void getUserInfo() async {
    try {
      final res = await authRepository.getAdminCode();
      userModel.value = res;
      Get.to(() => HomeScreen());
    } on Exception catch (e) {
      Get.snackbar(
        'Get Info Error',
        e.toString(),
      );
    }
  }

  void onRegister(
      {required String username,
      required String password,
      required String email,
      required String code}) async {
    try {
      EasyLoading.show();
      await authRepository.register(
          fullname: username, password: password, email: email, code: code);
      Get.offAll(() => Login(title: 'Login'));
    } on Exception catch (e) {
      Get.snackbar('Register failed', e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  void logout() async {
    Get.offAll(() => Login(title: 'Login'));
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('accessToken');
  }
}
