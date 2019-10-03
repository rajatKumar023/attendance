import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sections.g.dart';

class Section extends EnumClass {
  static Serializer<Section> get serializer => _$sectionSerializer;

  static const Section CS = _$CS;
  static const Section IT = _$IT;

  const Section._(String name) : super(name);

  static BuiltSet<Section> get values => _$vlu;

  static Section valueOf(String name) => _$vluOf(name);

  static String displayValue(Section s) {
    switch (s) {
      case Section.CS:
        return "CS";
      case Section.IT:
        return "IT";
    }

    return "";
  }
}
