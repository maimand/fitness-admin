// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return LoginRequest(
    json['username'] as String?,
    json['password'] as String?,
  );
}

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) {
  return LoginResult(
    json['access_token'] as String?,
  );
}

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    fullname: json['fullname'] as String?,
    email: json['email'] as String?,
    height: (json['height'] as num?)?.toDouble(),
    weight: (json['weight'] as num?)?.toDouble(),
    fatPercent: (json['fatPercent'] as num?)?.toDouble(),
    age: json['age'] as int?,
    gender: json['gender'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullname': instance.fullname,
      'email': instance.email,
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
      'fatPercent': instance.fatPercent,
      'gender': instance.gender,
    };

AdminModel _$AdminModelFromJson(Map<String, dynamic> json) {
  return AdminModel(
    fullname: json['fullname'] as String?,
    email: json['email'] as String?,
    centerName: json['centerName'] as String?,
    center: json['center'] as String?,
  );
}

Map<String, dynamic> _$AdminModelToJson(AdminModel instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'email': instance.email,
      'center': instance.center,
      'centerName': instance.centerName,
    };

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) {
  return UpdateUserRequest(
    fullname: json['fullname'] as String?,
    height: (json['height'] as num?)?.toDouble(),
    weight: (json['weight'] as num?)?.toDouble(),
    fatPercent: (json['fatPercent'] as num?)?.toDouble(),
    age: json['age'] as int?,
    gender: json['gender'] as String?,
  );
}

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
      'fatPercent': instance.fatPercent,
      'gender': instance.gender,
    };

UserInfoPredictRequest _$UserInfoPredictRequestFromJson(
    Map<String, dynamic> json) {
  return UserInfoPredictRequest(
    (json['neck'] as num).toDouble(),
    (json['waist'] as num).toDouble(),
    (json['height'] as num).toDouble(),
  );
}

Map<String, dynamic> _$UserInfoPredictRequestToJson(
        UserInfoPredictRequest instance) =>
    <String, dynamic>{
      'neck': instance.neck,
      'waist': instance.waist,
      'height': instance.height,
    };

UserInfoAdvancePredictRequest _$UserInfoAdvancePredictRequestFromJson(
    Map<String, dynamic> json) {
  return UserInfoAdvancePredictRequest(
    (json['age'] as num).toDouble(),
    (json['neck'] as num).toDouble(),
    (json['chest'] as num).toDouble(),
    (json['waist'] as num).toDouble(),
    (json['hip'] as num).toDouble(),
    (json['thingh'] as num).toDouble(),
    (json['weight'] as num).toDouble(),
    (json['height'] as num).toDouble(),
    json['sex'] as String,
  );
}

Map<String, dynamic> _$UserInfoAdvancePredictRequestToJson(
        UserInfoAdvancePredictRequest instance) =>
    <String, dynamic>{
      'age': instance.age,
      'neck': instance.neck,
      'chest': instance.chest,
      'waist': instance.waist,
      'hip': instance.hip,
      'thingh': instance.thingh,
      'weight': instance.weight,
      'height': instance.height,
      'sex': instance.sex,
    };
