import 'package:json_annotation/json_annotation.dart';

part 'mektaba.g.dart';

enum TimeUnits { day, month, year }

class Faq {
  String question;
  String response;

  Faq({
    required this.question,
    required this.response,
  });
}

enum OfficeHours { day, hours }

@JsonSerializable(explicitToJson: true)
class Mektaba {
  @JsonKey(name: '_id')
  String id;
  String name;
  String description;
  String logo;
  String cover;
  String address;
  String? adressComplement;
  String zipCode;
  String city;
  String country;
  String phone;
  String email;
  int loanDuration;
  TimeUnits loanUnit;
  int simultaneousLoans;
  String loanCost;
  String lateCost;
  String? membershipPeriod;
  int? reservedStatusDuration;
  TimeUnits? reservedStatusDurationUnit;
  bool disableReservedOption;
  List<Object>? faq; // maybe we can make the type stronger
  List<Object> officeHours; // maybe we can make the type stronger
  bool accessibleToEveryone;
  bool canPerformAblution;
  bool canPray;
  bool canTakeCourses;
  List<String> employees;
  String owner;
  bool isEnabled;
  String? website;
  String? facebook;
  String? whatsapp;
  String? instagram;

  Mektaba({
    required this.id,
    required this.name,
    required this.description,
    required this.logo,
    required this.cover,
    required this.address,
    this.adressComplement,
    required this.zipCode,
    required this.city,
    required this.country,
    required this.phone,
    required this.email,
    required this.loanDuration,
    required this.loanUnit,
    required this.simultaneousLoans,
    required this.loanCost,
    required this.lateCost,
    this.membershipPeriod,
    this.reservedStatusDuration,
    this.reservedStatusDurationUnit,
    this.disableReservedOption = false,
    required this.faq,
    required this.officeHours,
    this.accessibleToEveryone = false,
    this.canPerformAblution = false,
    this.canPray = false,
    this.canTakeCourses = false,
    this.employees = const [],
    required this.owner,
    this.isEnabled = true,
    this.website,
    this.facebook,
    this.whatsapp,
    this.instagram,
  });

  /// Connect the generated [_$MektabaFromJson] function to the `fromJson`
  /// factory.
  factory Mektaba.fromJson(Map<String, dynamic> json) =>
      _$MektabaFromJson(json);

  /// Connect the generated [_$MektabaToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MektabaToJson(this);
}
