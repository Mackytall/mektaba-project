// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      email: json['email'] as String,
      photo: json['photo'] as String?,
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      zipCode: json['zipCode'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      likedEvents: (json['likedEvents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      likedStocks: (json['likedStocks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'email': instance.email,
      'photo': instance.photo,
      'role': _$UserRoleEnumMap[instance.role],
      'phone': instance.phone,
      'address': instance.address,
      'zipCode': instance.zipCode,
      'city': instance.city,
      'country': instance.country,
      'likedEvents': instance.likedEvents,
      'likedStocks': instance.likedStocks,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.user: 'user',
  UserRole.adherent: 'adherent',
  UserRole.student: 'student',
};

CreateUser _$CreateUserFromJson(Map<String, dynamic> json) => CreateUser(
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      email: json['email'] as String,
      photo: json['photo'] as String?,
      phone: json['phone'] as String,
      address: json['address'] as String,
      zipCode: json['zipCode'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$CreateUserToJson(CreateUser instance) =>
    <String, dynamic>{
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'email': instance.email,
      'photo': instance.photo,
      'phone': instance.phone,
      'address': instance.address,
      'zipCode': instance.zipCode,
      'city': instance.city,
      'country': instance.country,
      'password': instance.password,
    };

LogUser _$LogUserFromJson(Map<String, dynamic> json) => LogUser(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LogUserToJson(LogUser instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
