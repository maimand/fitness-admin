import 'package:dio/dio.dart';
import 'package:smart_admin_dashboard/services/constants/api_constants.dart';
import 'package:smart_admin_dashboard/services/services/network_service.dart';

class DietProvider {
  final NetWorkService networkService;

  DietProvider(this.networkService);

  final String getDietUrl = '$baseUrl/diet';
  final String postFoodUrl = '$baseUrl/diet';
  final String predictFoodUrl = '$foodUrl/food-predict';

  Future<HttpResponse> getDiet(
      {String? food, required int page, required int size}) {
    return networkService.get(getDietUrl,
        queryParameters: {"name": food, "page": page, "size": size});
  }

  Future<HttpResponse> getFoodDetailByName({required String name}) {
    return networkService.get('$getDietUrl/$name');
  }

  Future<HttpResponse> predictFood({required String path}) async {
    return networkService.post(predictFoodUrl,
        options: Options(headers: {'X-Api-Key': '123456'}),
        formData: {'file': await MultipartFile.fromFile(path)});
  }
}
