
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

  Future<UserModel> getUserInfo() async {
    final response = await provider.getUserInfo();
    final result = UserModel.fromJson(response.body);
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

  Future<double?> predictFat(UserInfoAdvancePredictRequest request) async {
    final res = await provider.predictFat(request);
    return res.body['res'];
  }

  Future<void> updateUser(UpdateUserRequest request) {
    return provider.updateUser(request);
  }

  // Future<void> register(String username, String password, String firstName,
  //     String lastName) async {
  //   final response =
  //   await provider.register(username, password, firstName, lastName);
  //   if (response.statusCode != 200) {
  //     throw Exception("Register failed");
  //   }
  // }
}
