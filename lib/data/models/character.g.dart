// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(
  Map<String, dynamic> json,
) => _$CharacterImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status: json['status'] as String,
  species: json['species'] as String,
  gender: json['gender'] as String,
  image: json['image'] as String,
  origin: CharacterLocation.fromJson(json['origin'] as Map<String, dynamic>),
  location: CharacterLocation.fromJson(
    json['location'] as Map<String, dynamic>,
  ),
  episode: (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'gender': instance.gender,
      'image': instance.image,
      'origin': instance.origin,
      'location': instance.location,
      'episode': instance.episode,
    };

_$CharacterLocationImpl _$$CharacterLocationImplFromJson(
  Map<String, dynamic> json,
) => _$CharacterLocationImpl(
  name: json['name'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$$CharacterLocationImplToJson(
  _$CharacterLocationImpl instance,
) => <String, dynamic>{'name': instance.name, 'url': instance.url};
