// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stockWithBookDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockWithBookDetail _$StockWithBookDetailFromJson(Map<String, dynamic> json) =>
    StockWithBookDetail(
      id: json['_id'] as String,
      internalHu: json['internalHu'] as String,
      externalHu: json['externalHu'] as String,
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
      mektaba: json['mektaba'] as String,
      onlyOnSiteConsultation: json['onlyOnSiteConsultation'] as bool,
      status: json['status'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      updatedBy: json['updatedBy'] as String?,
      deletedBy: json['deletedBy'] as String?,
      deletedAt: json['deletedAt'] as String?,
    );

Map<String, dynamic> _$StockWithBookDetailToJson(
        StockWithBookDetail instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'internalHu': instance.internalHu,
      'externalHu': instance.externalHu,
      'book': instance.book.toJson(),
      'mektaba': instance.mektaba,
      'onlyOnSiteConsultation': instance.onlyOnSiteConsultation,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'deletedBy': instance.deletedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
