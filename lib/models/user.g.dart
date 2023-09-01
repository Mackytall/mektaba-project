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
      address: json['address'] as String?,
      zipCode: json['zipCode'] as String?,
      city: json['city'] as String?,
      phone: json['phone'] as String?,
      likedEvents: (json['likedEvents'] as List<dynamic>?)
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
      'address': instance.address,
      'zipCode': instance.zipCode,
      'city': instance.city,
      'phone': instance.phone,
      'likedEvents': instance.likedEvents,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.user: 'user',
  UserRole.adherent: 'adherent',
  UserRole.student: 'student',
};
