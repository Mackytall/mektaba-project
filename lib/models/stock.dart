import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

enum StockStatus {
  draft,
  published,
  deleted,
}

extension StockStatusExtension on StockStatus {
  String get value {
    switch (this) {
      case StockStatus.draft:
        return 'draft';
      case StockStatus.published:
        return 'online';
      case StockStatus.deleted:
        return 'deleted';
    }
  }

  static StockStatus fromValue(String value) {
    switch (value) {
      case 'draft':
        return StockStatus.draft;
      case 'online':
        return StockStatus.published;
      case 'deleted':
        return StockStatus.deleted;
      default:
        throw ArgumentError('Unknown value: $value');
    }
  }
}


@JsonSerializable(explicitToJson: true)
class Stock {
  @JsonKey(name: '_id')
  String id;
  String internalHu;
  String externalHu;
  String book;
  String mektaba;
  String onlyOnSiteConsultation;
  String status;
  String createdBy;
  String? updatedBy;
  String? deletedBy;
  String createdAt;
  String updatedAt;
  String? deletedAt;

  Stock({
    required this.id,
    required this.internalHu,
    required this.externalHu,
    required this.book,
    required this.mektaba,
    required this.onlyOnSiteConsultation,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
     this.updatedBy,
     this.deletedBy,
     this.deletedAt,
  });

  /// Connect the generated [_$StockFromJson] function to the `fromJson`
  /// factory.
  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  /// Connect the generated [_$StockToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$StockToJson(this);

}