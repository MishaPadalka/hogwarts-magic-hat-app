// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guesses_amount_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GuessesAmountModelAdapter extends TypeAdapter<GuessesAmountModel> {
  @override
  final int typeId = 4;

  @override
  GuessesAmountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GuessesAmountModel(
      total: fields[0] as int,
      success: fields[1] as int,
      failed: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GuessesAmountModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.success)
      ..writeByte(2)
      ..write(obj.failed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuessesAmountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
