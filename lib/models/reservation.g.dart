// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) => Reservation(
      user: json['_id'] as String,
      mektaba: json['mektaba'] as String,
      stock: json['stock'] as String,
      status: $enumDecode(_$ReservationStatusEnumMap, json['status']),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      '_id': instance.user,
      'mektaba': instance.mektaba,
      'stock': instance.stock,
      'status': _$ReservationStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

const _$ReservationStatusEnumMap = {
  ReservationStatus.loan: 'loan',
  ReservationStatus.available: 'available',
  ReservationStatus.reserved: 'reserved',
  ReservationStatus.deleted: 'deleted',
};

ReserveStock _$ReserveStockFromJson(Map<String, dynamic> json) => ReserveStock(
      user: json['user'] as String,
      mektaba: json['mektaba'] as String,
    );

Map<String, dynamic> _$ReserveStockToJson(ReserveStock instance) =>
    <String, dynamic>{
      'user': instance.user,
      'mektaba': instance.mektaba,
    };
