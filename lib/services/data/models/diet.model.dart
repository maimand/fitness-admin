import 'package:json_annotation/json_annotation.dart';
part 'diet.model.g.dart';

@JsonSerializable(explicitToJson: true)
class FoodList {
  List<Food>? items;
  int? size;
  int? page;
  int? total;

  FoodList({this.items, this.page, this.size, this.total});

  factory FoodList.fromJson(Map<String, dynamic> json) =>
      _$FoodListFromJson(json);

  Map<String, dynamic> toJson() => _$FoodListToJson(this);
}

@JsonSerializable()
class Food {
  final String? id;
  final String? name;
  final String? ration;
  final double? calo;
  final double? protein;
  final double? fat;
  final double? carb;
  final double? fiber;

  Food(
      {this.id,
      this.name,
      this.ration,
      this.calo,
      this.protein,
      this.fat,
      this.carb,
      this.fiber});

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}

@JsonSerializable()
class FoodLogRequest {
  final String foodId;
  final String foodName;
  final int number;
  final int totalCaloriesIntake;

  FoodLogRequest(
      this.foodId, this.foodName, this.number, this.totalCaloriesIntake);

  factory FoodLogRequest.fromJson(Map<String, dynamic> json) =>
      _$FoodLogRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FoodLogRequestToJson(this);
}

@JsonSerializable()
class FoodLog {
  final String? foodId;
  final String? foodName;
  final DateTime? time;
  final int? number;
  final int? totalCaloriesIntake;

  FoodLog(this.foodId, this.foodName, this.time, this.number,
      this.totalCaloriesIntake);

  factory FoodLog.fromJson(Map<String, dynamic> json) =>
      _$FoodLogFromJson(json);

  Map<String, dynamic> toJson() => _$FoodLogToJson(this);
}
