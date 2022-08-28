// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'puzzeler_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PuzzelerItem {
  int get id => throw _privateConstructorUsedError;
  Image get image => throw _privateConstructorUsedError;
  bool get correct => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PuzzelerItemCopyWith<PuzzelerItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PuzzelerItemCopyWith<$Res> {
  factory $PuzzelerItemCopyWith(
          PuzzelerItem value, $Res Function(PuzzelerItem) then) =
      _$PuzzelerItemCopyWithImpl<$Res>;
  $Res call({int id, Image image, bool correct});
}

/// @nodoc
class _$PuzzelerItemCopyWithImpl<$Res> implements $PuzzelerItemCopyWith<$Res> {
  _$PuzzelerItemCopyWithImpl(this._value, this._then);

  final PuzzelerItem _value;
  // ignore: unused_field
  final $Res Function(PuzzelerItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? correct = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PuzzelerItemCopyWith<$Res>
    implements $PuzzelerItemCopyWith<$Res> {
  factory _$$_PuzzelerItemCopyWith(
          _$_PuzzelerItem value, $Res Function(_$_PuzzelerItem) then) =
      __$$_PuzzelerItemCopyWithImpl<$Res>;
  @override
  $Res call({int id, Image image, bool correct});
}

/// @nodoc
class __$$_PuzzelerItemCopyWithImpl<$Res>
    extends _$PuzzelerItemCopyWithImpl<$Res>
    implements _$$_PuzzelerItemCopyWith<$Res> {
  __$$_PuzzelerItemCopyWithImpl(
      _$_PuzzelerItem _value, $Res Function(_$_PuzzelerItem) _then)
      : super(_value, (v) => _then(v as _$_PuzzelerItem));

  @override
  _$_PuzzelerItem get _value => super._value as _$_PuzzelerItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? correct = freezed,
  }) {
    return _then(_$_PuzzelerItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PuzzelerItem with DiagnosticableTreeMixin implements _PuzzelerItem {
  const _$_PuzzelerItem(
      {required this.id, required this.image, this.correct = false});

  @override
  final int id;
  @override
  final Image image;
  @override
  @JsonKey()
  final bool correct;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PuzzelerItem(id: $id, image: $image, correct: $correct)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PuzzelerItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('correct', correct));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PuzzelerItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.correct, correct));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(correct));

  @JsonKey(ignore: true)
  @override
  _$$_PuzzelerItemCopyWith<_$_PuzzelerItem> get copyWith =>
      __$$_PuzzelerItemCopyWithImpl<_$_PuzzelerItem>(this, _$identity);
}

abstract class _PuzzelerItem implements PuzzelerItem {
  const factory _PuzzelerItem(
      {required final int id,
      required final Image image,
      final bool correct}) = _$_PuzzelerItem;

  @override
  int get id;
  @override
  Image get image;
  @override
  bool get correct;
  @override
  @JsonKey(ignore: true)
  _$$_PuzzelerItemCopyWith<_$_PuzzelerItem> get copyWith =>
      throw _privateConstructorUsedError;
}
