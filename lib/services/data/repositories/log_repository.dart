
import 'package:smart_admin_dashboard/services/data/models/diet.model.dart';
import 'package:smart_admin_dashboard/services/data/models/exercise.model.dart';
import 'package:smart_admin_dashboard/services/data/providers/log_provider.dart';

class LogRepository {
  final LogProvider provider;

  LogRepository(this.provider);


  Future<List<FoodLog>> getDietLog() async {
    final response = await provider.getDietLogs();
    final result = (response.body['data'] as List)
        .map((e) => FoodLog.fromJson(e))
        .toList();
    return result;
  }

  Future<List<ExerciseLog>> getExerciseLog() async {
    final response = await provider.getExerciseLogs();
    final result = (response.body['data'] as List)
        .map((e) => ExerciseLog.fromJson(e))
        .toList();
    return result;
  }
}
