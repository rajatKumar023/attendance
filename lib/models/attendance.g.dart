// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Attendance> _$attendanceSerializer = new _$AttendanceSerializer();

class _$AttendanceSerializer implements StructuredSerializer<Attendance> {
  @override
  final Iterable<Type> types = const [Attendance, _$Attendance];
  @override
  final String wireName = 'Attendance';

  @override
  Iterable<Object> serialize(Serializers serializers, Attendance object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'section',
      serializers.serialize(object.section,
          specifiedType: const FullType(Section)),
      'subSection',
      serializers.serialize(object.subSection,
          specifiedType: const FullType(String)),
      'totalStudents',
      serializers.serialize(object.totalStudents,
          specifiedType: const FullType(String)),
      'presentStudents',
      serializers.serialize(object.presentStudents,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Attendance deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AttendanceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'section':
          result.section = serializers.deserialize(value,
              specifiedType: const FullType(Section)) as Section;
          break;
        case 'subSection':
          result.subSection = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'totalStudents':
          result.totalStudents = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'presentStudents':
          result.presentStudents = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Attendance extends Attendance {
  @override
  final String name;
  @override
  final String id;
  @override
  final Section section;
  @override
  final String subSection;
  @override
  final String totalStudents;
  @override
  final String presentStudents;

  factory _$Attendance([void Function(AttendanceBuilder) updates]) =>
      (new AttendanceBuilder()..update(updates)).build();

  _$Attendance._(
      {this.name,
      this.id,
      this.section,
      this.subSection,
      this.totalStudents,
      this.presentStudents})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Attendance', 'name');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Attendance', 'id');
    }
    if (section == null) {
      throw new BuiltValueNullFieldError('Attendance', 'section');
    }
    if (subSection == null) {
      throw new BuiltValueNullFieldError('Attendance', 'subSection');
    }
    if (totalStudents == null) {
      throw new BuiltValueNullFieldError('Attendance', 'totalStudents');
    }
    if (presentStudents == null) {
      throw new BuiltValueNullFieldError('Attendance', 'presentStudents');
    }
  }

  @override
  Attendance rebuild(void Function(AttendanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttendanceBuilder toBuilder() => new AttendanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Attendance &&
        name == other.name &&
        id == other.id &&
        section == other.section &&
        subSection == other.subSection &&
        totalStudents == other.totalStudents &&
        presentStudents == other.presentStudents;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, name.hashCode), id.hashCode), section.hashCode),
                subSection.hashCode),
            totalStudents.hashCode),
        presentStudents.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Attendance')
          ..add('name', name)
          ..add('id', id)
          ..add('section', section)
          ..add('subSection', subSection)
          ..add('totalStudents', totalStudents)
          ..add('presentStudents', presentStudents))
        .toString();
  }
}

class AttendanceBuilder implements Builder<Attendance, AttendanceBuilder> {
  _$Attendance _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  Section _section;
  Section get section => _$this._section;
  set section(Section section) => _$this._section = section;

  String _subSection;
  String get subSection => _$this._subSection;
  set subSection(String subSection) => _$this._subSection = subSection;

  String _totalStudents;
  String get totalStudents => _$this._totalStudents;
  set totalStudents(String totalStudents) =>
      _$this._totalStudents = totalStudents;

  String _presentStudents;
  String get presentStudents => _$this._presentStudents;
  set presentStudents(String presentStudents) =>
      _$this._presentStudents = presentStudents;

  AttendanceBuilder();

  AttendanceBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _id = _$v.id;
      _section = _$v.section;
      _subSection = _$v.subSection;
      _totalStudents = _$v.totalStudents;
      _presentStudents = _$v.presentStudents;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Attendance other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Attendance;
  }

  @override
  void update(void Function(AttendanceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Attendance build() {
    final _$result = _$v ??
        new _$Attendance._(
            name: name,
            id: id,
            section: section,
            subSection: subSection,
            totalStudents: totalStudents,
            presentStudents: presentStudents);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
