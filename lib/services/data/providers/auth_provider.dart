import 'package:smart_admin_dashboard/services/constants/api_constants.dart';
import 'package:smart_admin_dashboard/services/services/network_service.dart';

class AuthProvider {
  final NetWorkService networkService;

  AuthProvider(this.networkService);

  final String loginUrl = '$baseUrl/admin/login';
  final String registerUrl = '$baseUrl/admin/new';

  Future<HttpResponse> login(String username, String password) {
    return networkService
        .post(loginUrl, data: {"username": username, "password": password});
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


}
