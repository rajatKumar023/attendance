// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Section _$CS = const Section._('CS');
const Section _$IT = const Section._('IT');

Section _$vluOf(String name) {
  switch (name) {
    case 'CS':
      return _$CS;
    case 'IT':
      return _$IT;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Section> _$vlu = new BuiltSet<Section>(const <Section>[
  _$CS,
  _$IT,
]);

Serializer<Section> _$sectionSerializer = new _$SectionSerializer();

class _$SectionSerializer implements PrimitiveSerializer<Section> {
  @override
  final Iterable<Type> types = const <Type>[Section];
  @override
  final String wireName = 'Section';

  @override
  Object serialize(Serializers serializers, Section object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Section deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Section.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
