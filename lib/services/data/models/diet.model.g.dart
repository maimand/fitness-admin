// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodList _$FoodListFromJson(Map<String, dynamic> json) {
  return FoodList(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Food.fromJson(e as Map<String, dynamic>))
        .toList(),
    page: json['page'] as int?,
    size: json['size'] as int?,
    total: json['total'] as int?,
  );
}

Map<String, dynamic> _$FoodListToJson(FoodList instance) => <String, dynamic>{
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'size': instance.size,
      'page': instance.page,
      'total': instance.total,
    };

Food _$FoodFromJson(Map<String, dynamic> json) {
  return Food(
    id: json['id'] as String?,
    name: json['name'] as String?,
    ration: json['ration'] as String?,
    calo: (json['calo'] as num?)?.toDouble(),
    protein: (json['protein'] as num?)?.toDouble(),
    fat: (json['fat'] as num?)?.toDouble(),
    carb: (json['carb'] as num?)?.toDouble(),
    fiber: (json['fiber'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ration': instance.ration,
      'calo': instance.calo,
      'protein': instance.protein,
      'fat': instance.fat,
      'carb': instance.carb,
      'fiber': instance.fiber,
    };

FoodLogRequest _$FoodLogRequestFromJson(Map<String, dynamic> json) {
  return FoodLogRequest(
    json['foodId'] as String,
    json['foodName'] as String,
    json['number'] as int,
    json['totalCaloriesIntake'] as int,
  );
}

Map<String, dynamic> _$FoodLogRequestToJson(FoodLogRequest instance) =>
    <String, dynamic>{
      'foodId': instance.foodId,
      'foodName': instance.foodName,
      'number': instance.number,
      'totalCaloriesIntake': instance.totalCaloriesIntake,
    };

FoodLog _$FoodLogFromJson(Map<String, dynamic> json) {
  return FoodLog(
    json['foodId'] as String?,
    json['foodName'] as String?,
    json['time'] == null ? null : DateTime.parse((json['time'] as String ) + 'Z'),
    json['number'] as int?,
    json['totalCaloriesIntake'] as int?,
  );
}

Map<String, dynamic> _$FoodLogToJson(FoodLog instance) => <String, dynamic>{
      'foodId': instance.foodId,
      'foodName': instance.foodName,
      'time': instance.time?.toIso8601String(),
      'number': instance.number,
      'totalCaloriesIntake': instance.totalCaloriesIntake,
    };
