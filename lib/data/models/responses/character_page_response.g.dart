// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterPageResponseImpl _$$CharacterPageResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CharacterPageResponseImpl(
  info: Info.fromJson(json['info'] as Map<String, dynamic>),
  results: (json['results'] as List<dynamic>)
      .map((e) => Character.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CharacterPageResponseImplToJson(
  _$CharacterPageResponseImpl instance,
) => <String, dynamic>{'info': instance.info, 'results': instance.results};
