import 'package:dio/dio.dart';
import 'package:smart_admin_dashboard/services/constants/api_constants.dart';
import 'package:smart_admin_dashboard/services/data/models/user.model.dart';
import 'package:smart_admin_dashboard/services/services/network_service.dart';

class AuthProvider {
  final NetWorkService networkService;

  AuthProvider(this.networkService);

  final String loginUrl = '$baseUrl/user/login';
  final String registerUrl = '$baseUrl/user/new';
  final String userInfoUrl = '$baseUrl/user/get-info';
  final String updateUserInfoUrl = '$baseUrl/user/update';

  final String predictUrl = '$predictFatUrl/advanced-fat-predict';

  Future<HttpResponse> login(String username, String password) {
    return networkService
        .post(loginUrl, data: {"username": username, "password": password});
  }

  Future<HttpResponse> getUserInfo() {
    return networkService.get(userInfoUrl);
  }

  Future<HttpResponse> register(
      {required String fullname,
      required String password,
      required String email,
      required String code}) {
    return networkService.post(registerUrl, data: {
      "fullname": fullname,
      "password": password,
      "email": email,
      "code": code
    });
  }

  Future<HttpResponse> updateUser(UpdateUserRequest request) {
    return networkService.put(updateUserInfoUrl, data: request.toJson());
  }

  Future<HttpResponse> predictFat(UserInfoAdvancePredictRequest request) {
    return networkService.get(
      predictUrl,
      queryParameters: request.toJson(),
      options: Options(headers: {'X-Api-Key': '123456'}),
    );
  }

  // Future<HttpResponse> resetPassword(String password) {
  //   final json = storage.read(user);
  //   final u = UserModel.fromJson(json);
  //   if (u.resetToken == null) throw Exception('Reset token is not available');
  //   return networkService
  //       .post('$reset/${u.resetToken}', data: {"password": password});
  // }
}
