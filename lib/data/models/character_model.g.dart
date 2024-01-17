// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      alternateNames: (json['alternate_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      species: json['species'] as String?,
      gender: json['gender'] as String?,
      house: json['house'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      yearOfBirth: json['yearOfBirth'] as int?,
      wizard: json['wizard'] as bool?,
      ancestry: json['ancestry'] as String?,
      eyeColour: json['eyeColour'] as String?,
      hairColour: json['hairColour'] as String?,
      wand: json['wand'] == null
          ? null
          : Wand.fromJson(json['wand'] as Map<String, dynamic>),
      patronus: json['patronus'] as String?,
      hogwartsStudent: json['hogwartsStudent'] as bool?,
      hogwartsStaff: json['hogwartsStaff'] as bool?,
      actor: json['actor'] as String?,
      alternateActors: (json['alternate_actors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      alive: json['alive'] as bool?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternate_names': instance.alternateNames,
      'species': instance.species,
      'gender': instance.gender,
      'house': instance.house,
      'dateOfBirth': instance.dateOfBirth,
      'yearOfBirth': instance.yearOfBirth,
      'wizard': instance.wizard,
      'ancestry': instance.ancestry,
      'eyeColour': instance.eyeColour,
      'hairColour': instance.hairColour,
      'wand': instance.wand,
      'patronus': instance.patronus,
      'hogwartsStudent': instance.hogwartsStudent,
      'hogwartsStaff': instance.hogwartsStaff,
      'actor': instance.actor,
      'alternate_actors': instance.alternateActors,
      'alive': instance.alive,
      'image': instance.image,
    };
