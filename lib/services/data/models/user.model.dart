import 'package:json_annotation/json_annotation.dart';
part 'user.model.g.dart';

@JsonSerializable()
class LoginRequest {
  final String? username;
  final String? password;

  LoginRequest(this.username, this.password);

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResult {
  @JsonKey(name: 'access_token')
  final String? accessToken;

  LoginResult(this.accessToken);

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}

@JsonSerializable()
class UserModel {
  final String? fullname;
  final String? email;
  final double? height;
  final double? weight;
  final int? age;
  final double? fatPercent;
  final String? gender;

  UserModel(
      {this.fullname,
      this.email,
      this.height,
      this.weight,
      this.fatPercent,
      this.age,
      this.gender});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UpdateUserRequest {
  final String? fullname;
  final double? height;
  final double? weight;
  final int? age;
  final double? fatPercent;
  final String? gender;

  UpdateUserRequest(
      {this.fullname,
      this.height,
      this.weight,
      this.fatPercent,
      this.age,
      this.gender});

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
}

@JsonSerializable()
class UserInfoPredictRequest {
  final double neck;
  final double waist;
  final double height;

  UserInfoPredictRequest(this.neck, this.waist, this.height);

  factory UserInfoPredictRequest.fromJson(Map<String, dynamic> json) =>
      _$UserInfoPredictRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoPredictRequestToJson(this);
}

@JsonSerializable()
class UserInfoAdvancePredictRequest {
  final double age;
  final double neck;
  final double chest;
  final double waist;
  final double hip;
  final double thingh;
  final double weight;
  final double height;
  final String sex;

  UserInfoAdvancePredictRequest(this.age, this.neck, this.chest, this.waist,
      this.hip, this.thingh, this.weight, this.height, this.sex);

  factory UserInfoAdvancePredictRequest.fromJson(Map<String, dynamic> json) =>
      _$UserInfoAdvancePredictRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoAdvancePredictRequestToJson(this);
}
