
import 'package:smart_admin_dashboard/services/data/models/diet.model.dart';
import 'package:smart_admin_dashboard/services/data/models/exercise.model.dart';
import 'package:smart_admin_dashboard/services/data/models/user.model.dart';
import 'package:smart_admin_dashboard/services/data/providers/log_provider.dart';

class LogRepository {
  final LogProvider provider;

  LogRepository(this.provider);


  Future<List<FoodLog>> getDietLog(String email) async {
    final response = await provider.getDietLogs(email);
    final result = (response.body['data'] as List)
        .map((e) => FoodLog.fromJson(e))
        .toList();
    return result;
  }

  Future<List<ExerciseLog>> getExerciseLog(String email) async {
    final response = await provider.getExerciseLogs(email);
    final result = (response.body['data'] as List)
        .map((e) => ExerciseLog.fromJson(e))
        .toList();
    return result;
  }

  Future<List<UserModel>> getUser() async {
    final response = await provider.getUsers();
    final result = (response.body['data'] as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
    return result;
  }

  Future<String> getAdminCode() async {
    final response = await provider.getUserCode();
    return response.body['data'] as String;
  }

  Future<String> deleteUser(String email) async {
    final response = await provider.deleteUser(email);
    return response.body['data'] as String;
  }
}
