// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) {
  return ExerciseModel(
    json['name'] as String?,
    json['videoUrl'] as String?,
  );
}

Map<String, dynamic> _$ExerciseModelToJson(ExerciseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'videoUrl': instance.videoUrl,
    };

ExerciseDetailModel _$ExerciseDetailModelFromJson(Map<String, dynamic> json) {
  return ExerciseDetailModel(
    name: json['name'] as String?,
    videoUrl: json['videoUrl'] as String?,
    difficulty: json['difficulty'] as String?,
    instructions: json['instructions'] as String?,
    caloriesBurn: (json['caloriesBurn'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ExerciseDetailModelToJson(
        ExerciseDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'videoUrl': instance.videoUrl,
      'difficulty': instance.difficulty,
      'instructions': instance.instructions,
      'caloriesBurn': instance.caloriesBurn,
    };

ExerciseLogRequest _$ExerciseLogRequestFromJson(Map<String, dynamic> json) {
  return ExerciseLogRequest(
    json['exerciseName'] as String,
    json['reps'] as int,
    json['totalCaloriesBurn'] as int,
  );
}

Map<String, dynamic> _$ExerciseLogRequestToJson(ExerciseLogRequest instance) =>
    <String, dynamic>{
      'exerciseName': instance.exerciseName,
      'reps': instance.reps,
      'totalCaloriesBurn': instance.totalCaloriesBurn,
    };

ExerciseLog _$ExerciseLogFromJson(Map<String, dynamic> json) {
  return ExerciseLog(
    json['exerciseName'] as String?,
    json['reps'] as int?,
    json['time'] == null ? null : DateTime.parse(json['time'] as String),
    json['totalCaloriesBurn'] as int?,
  );
}

Map<String, dynamic> _$ExerciseLogToJson(ExerciseLog instance) =>
    <String, dynamic>{
      'exerciseName': instance.exerciseName,
      'reps': instance.reps,
      'time': instance.time?.toIso8601String(),
      'totalCaloriesBurn': instance.totalCaloriesBurn,
    };
