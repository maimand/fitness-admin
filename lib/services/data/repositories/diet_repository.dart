
import 'package:smart_admin_dashboard/services/data/models/diet.model.dart';
import 'package:smart_admin_dashboard/services/data/providers/diet_provider.dart';

class DietRepository {
  final DietProvider provider;

  DietRepository(this.provider);

  Future<FoodList> getFoods(
      {String name = '', int page = 0, int size = 20}) async {
    final response = await provider.getDiet(food: name, page: page, size: size);
    final result = FoodList.fromJson(response.body);
    return result;
  }

  Future<Food> getFoodByName({required String name}) async {
    final response = await provider.getFoodDetailByName(name: name);
    if(response.body['data'] == null) {
      throw 'No food found';
    }
    final result = Food.fromJson(response.body['data']);
    return result;
  }

  Future<Food> predictFood(String path) async {
    try {
      final res = await provider.predictFood(path: path);
      final String name = res.body['res'];
      final r =  await getFoodByName(name: name.trim());
      return r;
    } on Exception {
      rethrow ;
    }
  }
}
