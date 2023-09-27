// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mektaba.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficeHours _$OfficeHoursFromJson(Map<String, dynamic> json) => OfficeHours(
      day: json['day'] as String,
      hours: json['hours'] as String,
    );

Map<String, dynamic> _$OfficeHoursToJson(OfficeHours instance) =>
    <String, dynamic>{
      'day': instance.day,
      'hours': instance.hours,
    };

Faq _$FaqFromJson(Map<String, dynamic> json) => Faq(
      question: json['question'] as String,
      response: json['response'] as String,
    );

Map<String, dynamic> _$FaqToJson(Faq instance) => <String, dynamic>{
      'question': instance.question,
      'response': instance.response,
    };

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
      faq: (json['faq'] as List<dynamic>?)
          ?.map((e) => Faq.fromJson(e as Map<String, dynamic>))
          .toList(),
      officeHours: (json['officeHours'] as List<dynamic>?)
          ?.map((e) => OfficeHours.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessibleToEveryone: json['accessibleToEveryone'] as bool? ?? false,
      canPerformAblution: json['canPerformAblution'] as bool? ?? false,
      canPray: json['canPray'] as bool? ?? false,
      canTakeCourses: json['canTakeCourses'] as bool? ?? false,
      employees: (json['employees'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
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
      'faq': instance.faq?.map((e) => e.toJson()).toList(),
      'officeHours': instance.officeHours?.map((e) => e.toJson()).toList(),
      'accessibleToEveryone': instance.accessibleToEveryone,
      'canPerformAblution': instance.canPerformAblution,
      'canPray': instance.canPray,
      'canTakeCourses': instance.canTakeCourses,
      'employees': instance.employees,
      'members': instance.members?.map((e) => e.toJson()).toList(),
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

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      user: json['user'] as String,
      status: json['status'] as String,
      requestDate: json['requestDate'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'user': instance.user,
      'status': instance.status,
      'requestDate': instance.requestDate,
    };

SubscribeReq _$SubscribeReqFromJson(Map<String, dynamic> json) => SubscribeReq(
      user: json['user'] as String,
    );

Map<String, dynamic> _$SubscribeReqToJson(SubscribeReq instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
