// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wand_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WandLocalModelAdapter extends TypeAdapter<WandLocalModel> {
  @override
  final int typeId = 2;

  @override
  WandLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WandLocalModel(
      wood: fields[0] as String?,
      core: fields[1] as String?,
      length: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, WandLocalModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.wood)
      ..writeByte(1)
      ..write(obj.core)
      ..writeByte(2)
      ..write(obj.length);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WandLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
