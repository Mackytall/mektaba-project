// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mektaba.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mektaba _$MektabaFromJson(Map<String, dynamic> json) => Mektaba(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
      cover: json['cover'] as String?,
      address: json['address'] as String,
      adressComplement: json['adressComplement'] as String?,
      zipCode: json['zipCode'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      loanDuration: json['loanDuration'] as int?,
      loanUnit: $enumDecodeNullable(_$TimeUnitsEnumMap, json['loanUnit']),
      simultaneousLoans: json['simultaneousLoans'] as int?,
      loanCost: json['loanCost'] as String?,
      lateCost: json['lateCost'] as String?,
      membershipPeriod: json['membershipPeriod'] as String?,
      reservedStatusDuration: json['reservedStatusDuration'] as int?,
      reservedStatusDurationUnit: $enumDecodeNullable(
          _$TimeUnitsEnumMap, json['reservedStatusDurationUnit']),
      disableReservedOption: json['disableReservedOption'] as bool? ?? false,
      faq: (json['faq'] as List<dynamic>?)?.map((e) => e as Object).toList(),
      officeHours: (json['officeHours'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
      accessibleToEveryone: json['accessibleToEveryone'] as bool? ?? false,
      canPerformAblution: json['canPerformAblution'] as bool? ?? false,
      canPray: json['canPray'] as bool? ?? false,
      canTakeCourses: json['canTakeCourses'] as bool? ?? false,
      employees: (json['employees'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      owner: json['owner'] as String,
      isEnabled: json['isEnabled'] as bool? ?? false,
      website: json['website'] as String?,
      facebook: json['facebook'] as String?,
      whatsapp: json['whatsapp'] as String?,
      instagram: json['instagram'] as String?,
    );

Map<String, dynamic> _$MektabaToJson(Mektaba instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'logo': instance.logo,
      'cover': instance.cover,
      'address': instance.address,
      'adressComplement': instance.adressComplement,
      'zipCode': instance.zipCode,
      'city': instance.city,
      'country': instance.country,
      'phone': instance.phone,
      'email': instance.email,
      'loanDuration': instance.loanDuration,
      'loanUnit': _$TimeUnitsEnumMap[instance.loanUnit],
      'simultaneousLoans': instance.simultaneousLoans,
      'loanCost': instance.loanCost,
      'lateCost': instance.lateCost,
      'membershipPeriod': instance.membershipPeriod,
      'reservedStatusDuration': instance.reservedStatusDuration,
      'reservedStatusDurationUnit':
          _$TimeUnitsEnumMap[instance.reservedStatusDurationUnit],
      'disableReservedOption': instance.disableReservedOption,
      'faq': instance.faq,
      'officeHours': instance.officeHours,
      'accessibleToEveryone': instance.accessibleToEveryone,
      'canPerformAblution': instance.canPerformAblution,
      'canPray': instance.canPray,
      'canTakeCourses': instance.canTakeCourses,
      'employees': instance.employees,
      'owner': instance.owner,
      'isEnabled': instance.isEnabled,
      'website': instance.website,
      'facebook': instance.facebook,
      'whatsapp': instance.whatsapp,
      'instagram': instance.instagram,
    };

const _$TimeUnitsEnumMap = {
  TimeUnits.day: 'day',
  TimeUnits.month: 'month',
  TimeUnits.year: 'year',
};
