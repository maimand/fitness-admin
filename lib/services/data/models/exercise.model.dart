import 'package:json_annotation/json_annotation.dart';
part 'exercise.model.g.dart';

@JsonSerializable()
class ExerciseModel {
  final String? name;
  final String? videoUrl;

  ExerciseModel(this.name, this.videoUrl);

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);
}

@JsonSerializable()
class ExerciseDetailModel {
  final String? name;
  final String? videoUrl;
  final String? difficulty;
  final String? instructions;
  final double? caloriesBurn;

  ExerciseDetailModel(
      {this.name,
      this.videoUrl,
      this.difficulty,
      this.instructions,
      this.caloriesBurn});

  factory ExerciseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseDetailModelToJson(this);
}

@JsonSerializable()
class ExerciseLogRequest {
  final String exerciseName;
  final int reps;
  final int totalCaloriesBurn;

  ExerciseLogRequest(this.exerciseName, this.reps, this.totalCaloriesBurn);

  factory ExerciseLogRequest.fromJson(Map<String, dynamic> json) =>
      _$ExerciseLogRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseLogRequestToJson(this);
}

@JsonSerializable()
class ExerciseLog {
  final String? exerciseName;
  final int? reps;
  final DateTime? time;
  final int? totalCaloriesBurn;

  ExerciseLog(this.exerciseName, this.reps, this.time, this.totalCaloriesBurn);

  factory ExerciseLog.fromJson(Map<String, dynamic> json) =>
      _$ExerciseLogFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseLogToJson(this);
}
