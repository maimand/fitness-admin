
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

  Future<List<UserModel>> getUsers() async {
    final response = await provider.getUsers();
    final result = (response.body['data'] as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
    return result;
  }

  Future<List<UserModel>> getInactiveUsers() async {
    final response = await provider.getInactiveUsers();
    final result = (response.body['data'] as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
    return result;
  }


  Future<String> deleteUser(String email) async {
    final response = await provider.deleteUser(email);
    return response.body['data'] as String;
  }

  Future<void> resetUserPassword(String email) async {
    await provider.resetUserPassword(email);
  }

  Future<void> acceptUser(String email) async {
    await provider.acceptUser(email);
  }

  Future<void> enableUser(String email) async {
    await provider.enableUser(email);
  }

  Future<void> disableUser(String email) async {
    await provider.disableUser(email);
  }
}
