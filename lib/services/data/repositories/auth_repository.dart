
import 'package:smart_admin_dashboard/services/data/models/user.model.dart';
import 'package:smart_admin_dashboard/services/data/providers/auth_provider.dart';

class AuthRepository {
  final AuthProvider provider;

  AuthRepository(this.provider);

  Future<LoginResult> login(String username, password) async {
    final response = await provider.login(username, password);
    final result = LoginResult.fromJson(response.body);
    return result;
  }

  Future<void> register(
      {required String fullname,
      required String password,
      required String email,
      required String code}) async {
    await provider.register(
        fullname: fullname, password: password, email: email, code: code);
  }

  Future<AdminModel> getAdminCode() async {
    final response = await provider.getUserCode();
    final result = AdminModel.fromJson(response.body);
    return result;
  }


}
