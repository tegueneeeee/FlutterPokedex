// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonResultAdapter extends TypeAdapter<_$_PokemonResult> {
  @override
  final int typeId = 0;

  @override
  _$_PokemonResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PokemonResult(
      name: fields[0] as String,
      url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PokemonResult obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonResult _$$_PokemonResultFromJson(Map<String, dynamic> json) =>
    _$_PokemonResult(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_PokemonResultToJson(_$_PokemonResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
