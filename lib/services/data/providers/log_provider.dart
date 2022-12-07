
import 'package:smart_admin_dashboard/services/constants/api_constants.dart';
import 'package:smart_admin_dashboard/services/services/network_service.dart';

class LogProvider {
  final NetWorkService networkService;

  LogProvider(this.networkService);

  final String exerciseLogUrl = '$baseUrl/logs/exercises-logs';
  final String dietLogUrl = '$baseUrl/logs/food-logs';

  Future<HttpResponse> getDietLogs(
      {int page = 1, int size = 20}) {
    return networkService.get(
      dietLogUrl,
    );
    // queryParameters: {"page": page , "size": size});
  }

  Future<HttpResponse> getExerciseLogs(
      {int page = 1, int size = 20}) {
    return networkService.get(
      exerciseLogUrl,
    );
    // queryParameters: {"page": page , "size": size});
  }

  // Future<HttpResponse> getFoodDetailByName({required String name}) {
  //   return networkService.get('$getDietUrl/$name');
  // }
}
