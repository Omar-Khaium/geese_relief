// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_suggestion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchSuggestionAdapter extends TypeAdapter<SearchSuggestion> {
  @override
  final typeId = 0;

  @override
  SearchSuggestion read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchSuggestion(
      fields[0] as int,
      fields[1] as String,
      fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SearchSuggestion obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.keyword)
      ..writeByte(2)
      ..write(obj.isNew);
  }
}
