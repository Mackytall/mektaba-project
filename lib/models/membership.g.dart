// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Membership _$MembershipFromJson(Map<String, dynamic> json) => Membership(
      id: json['_id'] as String,
      user: json['user'] as String,
      mektaba: json['mektaba'] as String,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    )..requestDate = json['requestDate'] as String?;

Map<String, dynamic> _$MembershipToJson(Membership instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'mektaba': instance.mektaba,
      'status': instance.status,
      'requestDate': instance.requestDate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

Subscribe _$SubscribeFromJson(Map<String, dynamic> json) => Subscribe(
      user: json['_id'] as String,
      mektaba: json['mektaba'] as String,
    );

Map<String, dynamic> _$SubscribeToJson(Subscribe instance) => <String, dynamic>{
      '_id': instance.user,
      'mektaba': instance.mektaba,
    };
