import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_admin_dashboard/screens/home/home_screen.dart';
import 'package:smart_admin_dashboard/screens/login/login_screen.dart';
import 'package:smart_admin_dashboard/services/data/models/user.model.dart';
import 'package:smart_admin_dashboard/services/data/repositories/auth_repository.dart';

class AuthService extends GetxService {
  final AuthRepository authRepository;

  Rxn<UserModel> userModel = Rxn();

  AuthService(this.authRepository);

  @override
  void onInit() {
    getUserInformation();
    super.onInit();
  }

  void onLogin(String username, String password) async {
    try {
      final res = await authRepository.login(username, password);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', res.accessToken!);
      getUserInformation();
    } on Exception catch (e) {
      Get.snackbar(
        'Login Error',
        e.toString(),
      );
    }
  }

  Future<void> getUserInformation() async {
    try {
      final res = await authRepository.getUserInfo();
      userModel.value = res;

        Get.offAll(() => const HomeScreen());
    } on Exception catch (e) {
      Get.snackbar('Get User Info Error', e.toString());
    }
  }

  void onRegister(
      {required String username,
      required String password,
      required String email,
      required String code}) async {
    try {
      await authRepository.register(
          fullname: username, password: password, email: email, code: code);
    } on Exception catch (e) {
      Get.snackbar('Register failed', e.toString());
    }
  }

  void logout() async {
    Get.offAll(() => Login(title: 'Login'));
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('accessToken');
  }
}
