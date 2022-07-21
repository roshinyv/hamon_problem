// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'student_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StudentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStdData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getStdData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStdData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetStdData value) getStdData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetStdData value)? getStdData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetStdData value)? getStdData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentEventCopyWith<$Res> {
  factory $StudentEventCopyWith(
          StudentEvent value, $Res Function(StudentEvent) then) =
      _$StudentEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$StudentEventCopyWithImpl<$Res> implements $StudentEventCopyWith<$Res> {
  _$StudentEventCopyWithImpl(this._value, this._then);

  final StudentEvent _value;
  // ignore: unused_field
  final $Res Function(StudentEvent) _then;
}

/// @nodoc
abstract class _$$_GetStdDataCopyWith<$Res> {
  factory _$$_GetStdDataCopyWith(
          _$_GetStdData value, $Res Function(_$_GetStdData) then) =
      __$$_GetStdDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetStdDataCopyWithImpl<$Res> extends _$StudentEventCopyWithImpl<$Res>
    implements _$$_GetStdDataCopyWith<$Res> {
  __$$_GetStdDataCopyWithImpl(
      _$_GetStdData _value, $Res Function(_$_GetStdData) _then)
      : super(_value, (v) => _then(v as _$_GetStdData));

  @override
  _$_GetStdData get _value => super._value as _$_GetStdData;
}

/// @nodoc

class _$_GetStdData implements _GetStdData {
  const _$_GetStdData();

  @override
  String toString() {
    return 'StudentEvent.getStdData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetStdData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStdData,
  }) {
    return getStdData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getStdData,
  }) {
    return getStdData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStdData,
    required TResult orElse(),
  }) {
    if (getStdData != null) {
      return getStdData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetStdData value) getStdData,
  }) {
    return getStdData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetStdData value)? getStdData,
  }) {
    return getStdData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetStdData value)? getStdData,
    required TResult orElse(),
  }) {
    if (getStdData != null) {
      return getStdData(this);
    }
    return orElse();
  }
}

abstract class _GetStdData implements StudentEvent {
  const factory _GetStdData() = _$_GetStdData;
}

/// @nodoc
mixin _$StudentState {
  bool get isloading => throw _privateConstructorUsedError;
  List<Student>? get students => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StudentStateCopyWith<StudentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentStateCopyWith<$Res> {
  factory $StudentStateCopyWith(
          StudentState value, $Res Function(StudentState) then) =
      _$StudentStateCopyWithImpl<$Res>;
  $Res call({bool isloading, List<Student>? students});
}

/// @nodoc
class _$StudentStateCopyWithImpl<$Res> implements $StudentStateCopyWith<$Res> {
  _$StudentStateCopyWithImpl(this._value, this._then);

  final StudentState _value;
  // ignore: unused_field
  final $Res Function(StudentState) _then;

  @override
  $Res call({
    Object? isloading = freezed,
    Object? students = freezed,
  }) {
    return _then(_value.copyWith(
      isloading: isloading == freezed
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      students: students == freezed
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>?,
    ));
  }
}

/// @nodoc
abstract class _$$_StudentStateCopyWith<$Res>
    implements $StudentStateCopyWith<$Res> {
  factory _$$_StudentStateCopyWith(
          _$_StudentState value, $Res Function(_$_StudentState) then) =
      __$$_StudentStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isloading, List<Student>? students});
}

/// @nodoc
class __$$_StudentStateCopyWithImpl<$Res>
    extends _$StudentStateCopyWithImpl<$Res>
    implements _$$_StudentStateCopyWith<$Res> {
  __$$_StudentStateCopyWithImpl(
      _$_StudentState _value, $Res Function(_$_StudentState) _then)
      : super(_value, (v) => _then(v as _$_StudentState));

  @override
  _$_StudentState get _value => super._value as _$_StudentState;

  @override
  $Res call({
    Object? isloading = freezed,
    Object? students = freezed,
  }) {
    return _then(_$_StudentState(
      isloading: isloading == freezed
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      students: students == freezed
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>?,
    ));
  }
}

/// @nodoc

class _$_StudentState implements _StudentState {
  const _$_StudentState(
      {required this.isloading, final List<Student>? students})
      : _students = students;

  @override
  final bool isloading;
  final List<Student>? _students;
  @override
  List<Student>? get students {
    final value = _students;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StudentState(isloading: $isloading, students: $students)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StudentState &&
            const DeepCollectionEquality().equals(other.isloading, isloading) &&
            const DeepCollectionEquality().equals(other._students, _students));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isloading),
      const DeepCollectionEquality().hash(_students));

  @JsonKey(ignore: true)
  @override
  _$$_StudentStateCopyWith<_$_StudentState> get copyWith =>
      __$$_StudentStateCopyWithImpl<_$_StudentState>(this, _$identity);
}

abstract class _StudentState implements StudentState {
  const factory _StudentState(
      {required final bool isloading,
      final List<Student>? students}) = _$_StudentState;

  @override
  bool get isloading;
  @override
  List<Student>? get students;
  @override
  @JsonKey(ignore: true)
  _$$_StudentStateCopyWith<_$_StudentState> get copyWith =>
      throw _privateConstructorUsedError;
}
