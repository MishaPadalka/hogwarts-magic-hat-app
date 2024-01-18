// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chosen_character_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChosenCharacterLocalModelAdapter
    extends TypeAdapter<ChosenCharacterLocalModel> {
  @override
  final int typeId = 3;

  @override
  ChosenCharacterLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChosenCharacterLocalModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      alternateNames: (fields[2] as List?)?.cast<String>(),
      species: fields[3] as String?,
      gender: fields[4] as String?,
      house: fields[5] as String?,
      dateOfBirth: fields[6] as String?,
      yearOfBirth: fields[7] as int?,
      wizard: fields[8] as bool?,
      ancestry: fields[9] as String?,
      eyeColour: fields[10] as String?,
      hairColour: fields[11] as String?,
      wand: fields[12] as WandLocalModel?,
      patronus: fields[13] as String?,
      hogwartsStudent: fields[14] as bool?,
      hogwartsStaff: fields[15] as bool?,
      actor: fields[16] as String?,
      alternateActors: (fields[17] as List?)?.cast<String>(),
      alive: fields[18] as bool?,
      image: fields[19] as String?,
      attempts: fields[20] as int?,
      guessed: fields[21] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ChosenCharacterLocalModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.alternateNames)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.house)
      ..writeByte(6)
      ..write(obj.dateOfBirth)
      ..writeByte(7)
      ..write(obj.yearOfBirth)
      ..writeByte(8)
      ..write(obj.wizard)
      ..writeByte(9)
      ..write(obj.ancestry)
      ..writeByte(10)
      ..write(obj.eyeColour)
      ..writeByte(11)
      ..write(obj.hairColour)
      ..writeByte(12)
      ..write(obj.wand)
      ..writeByte(13)
      ..write(obj.patronus)
      ..writeByte(14)
      ..write(obj.hogwartsStudent)
      ..writeByte(15)
      ..write(obj.hogwartsStaff)
      ..writeByte(16)
      ..write(obj.actor)
      ..writeByte(17)
      ..write(obj.alternateActors)
      ..writeByte(18)
      ..write(obj.alive)
      ..writeByte(19)
      ..write(obj.image)
      ..writeByte(20)
      ..write(obj.attempts)
      ..writeByte(21)
      ..write(obj.guessed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChosenCharacterLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
