import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:async/async.dart';
import 'book.dart';
import 'package:http/http.dart' as http;

part 'stock.g.dart';

enum StockStatus { loan, available, reserved, deleted }

// extension StockStatusExtension on StockStatus {
//   String get value {
//     switch (this) {
//       case StockStatus.draft:
//         return 'draft';
//       case StockStatus.published:
//         return 'online';
//       case StockStatus.deleted:
//         return 'deleted';
//     }
//   }

//   static StockStatus fromValue(String value) {
//     switch (value) {
//       case 'draft':
//         return StockStatus.draft;
//       case 'online':
//         return StockStatus.published;
//       case 'deleted':
//         return StockStatus.deleted;
//       default:
//         throw ArgumentError('Unknown value: $value');
//     }
//   }
// }

@JsonSerializable(explicitToJson: true)
class Stock {
  @JsonKey(name: '_id')
  String id;
  String internalHu;
  String externalHu;
  String book;
  String mektaba;
  bool onlyOnSiteConsultation;
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

@JsonSerializable(explicitToJson: true)
class StockWithBookDet {
  @JsonKey(name: '_id')
  String id;
  String internalHu;
  String externalHu;
  Book book;
  String mektaba;
  bool onlyOnSiteConsultation;
  String status;
  String createdBy;
  String? updatedBy;
  String? deletedBy;
  String createdAt;
  String updatedAt;
  String? deletedAt;

  StockWithBookDet({
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

  /// Connect the generated [_$StockWithBookDetFromJson] function to the `fromJson`
  /// factory.
  factory StockWithBookDet.fromJson(Map<String, dynamic> json) =>
      _$StockWithBookDetFromJson(json);

  /// Connect the generated [_$StockWithBookDetToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$StockWithBookDetToJson(this);
}

final stocksCache =
    AsyncCache<List<StockWithBookDet>>(const Duration(seconds: 30));
Future<List<StockWithBookDet>> getStocksByMektaba(String mektabaId) async {
  return stocksCache.fetch(() async {
    const stocksUrl = "https://mektaba.imadelmahrad.com/api/mektaba/stocks";
    try {
      final response =
          await http.get(Uri.parse("$stocksUrl/mektaba/$mektabaId/true"));
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        final res = (parsed['stocks'] as List)
            .map((i) => StockWithBookDet.fromJson(i))
            .toList();
        return res;
      }
      return List.empty();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to load stocks');
    }
  });
}
