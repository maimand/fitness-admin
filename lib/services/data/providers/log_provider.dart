import 'package:smart_admin_dashboard/services/constants/api_constants.dart';
import 'package:smart_admin_dashboard/services/services/network_service.dart';

class LogProvider {
  final NetWorkService networkService;

  LogProvider(this.networkService);

  final String getUsersUrl = '$baseUrl/admin/get-users';
  final String getExerciseLogUrl = '$baseUrl/admin/exercises-logs';
  final String getFoodLogUrl = '$baseUrl/admin/food-logs';
  final String deleteUserUrl = '$baseUrl/admin/delete';
  final String resetPasswordUserUrl = '$baseUrl/admin/reset-password';

  Future<HttpResponse> getDietLogs(String email,
      {int page = 1, int size = 20}) {
    return networkService.get('$getFoodLogUrl/$email');
  }

  Future<HttpResponse> getExerciseLogs(String email,
      {int page = 1, int size = 20}) {
    return networkService.get('$getExerciseLogUrl/$email');
  }

  Future<HttpResponse> deleteUser(
    String email,
  ) {
    return networkService.delete('$deleteUserUrl/$email');
  }

  Future<HttpResponse> resetUserPassword(
    String email,
  ) {
    return networkService.get('$resetPasswordUserUrl/$email');
  }

  Future<HttpResponse> getUsers({int page = 1, int size = 20}) {
    return networkService.get(getUsersUrl);
  }



  // Future<HttpResponse> getFoodDetailByName({required String name}) {
  //   return networkService.get('$getDietUrl/$name');
  // }
}
