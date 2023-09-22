// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      id: json['_id'] as String,
      internalHu: json['internalHu'] as String,
      externalHu: json['externalHu'] as String,
      book: json['book'] as String,
      mektaba: json['mektaba'] as String,
      onlyOnSiteConsultation: json['onlyOnSiteConsultation'] as bool,
      status: $enumDecode(_$StockStatusEnumMap, json['status']),
      createdBy: json['createdBy'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      updatedBy: json['updatedBy'] as String?,
      deletedBy: json['deletedBy'] as String?,
      deletedAt: json['deletedAt'] as String?,
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      '_id': instance.id,
      'internalHu': instance.internalHu,
      'externalHu': instance.externalHu,
      'book': instance.book,
      'mektaba': instance.mektaba,
      'onlyOnSiteConsultation': instance.onlyOnSiteConsultation,
      'status': _$StockStatusEnumMap[instance.status]!,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'deletedBy': instance.deletedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

const _$StockStatusEnumMap = {
  StockStatus.loan: 'loan',
  StockStatus.available: 'available',
  StockStatus.reserved: 'reserved',
  StockStatus.deleted: 'deleted',
  StockStatus.draft: 'draft',
};

StockWithBookDet _$StockWithBookDetFromJson(Map<String, dynamic> json) =>
    StockWithBookDet(
      id: json['_id'] as String,
      internalHu: json['internalHu'] as String,
      externalHu: json['externalHu'] as String,
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
      mektaba: json['mektaba'] as String,
      onlyOnSiteConsultation: json['onlyOnSiteConsultation'] as bool,
      status: $enumDecode(_$StockStatusEnumMap, json['status']),
      createdBy: json['createdBy'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      updatedBy: json['updatedBy'] as String?,
      deletedBy: json['deletedBy'] as String?,
      deletedAt: json['deletedAt'] as String?,
    );

Map<String, dynamic> _$StockWithBookDetToJson(StockWithBookDet instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'internalHu': instance.internalHu,
      'externalHu': instance.externalHu,
      'book': instance.book.toJson(),
      'mektaba': instance.mektaba,
      'onlyOnSiteConsultation': instance.onlyOnSiteConsultation,
      'status': _$StockStatusEnumMap[instance.status]!,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'deletedBy': instance.deletedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
