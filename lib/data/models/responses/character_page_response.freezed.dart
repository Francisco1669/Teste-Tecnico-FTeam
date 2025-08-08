// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CharacterPageResponse _$CharacterPageResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CharacterPageResponse.fromJson(json);
}

/// @nodoc
mixin _$CharacterPageResponse {
  Info get info => throw _privateConstructorUsedError;
  List<Character> get results => throw _privateConstructorUsedError;

  /// Serializes this CharacterPageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterPageResponseCopyWith<CharacterPageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterPageResponseCopyWith<$Res> {
  factory $CharacterPageResponseCopyWith(
    CharacterPageResponse value,
    $Res Function(CharacterPageResponse) then,
  ) = _$CharacterPageResponseCopyWithImpl<$Res, CharacterPageResponse>;
  @useResult
  $Res call({Info info, List<Character> results});

  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class _$CharacterPageResponseCopyWithImpl<
  $Res,
  $Val extends CharacterPageResponse
>
    implements $CharacterPageResponseCopyWith<$Res> {
  _$CharacterPageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? info = null, Object? results = null}) {
    return _then(
      _value.copyWith(
            info: null == info
                ? _value.info
                : info // ignore: cast_nullable_to_non_nullable
                      as Info,
            results: null == results
                ? _value.results
                : results // ignore: cast_nullable_to_non_nullable
                      as List<Character>,
          )
          as $Val,
    );
  }

  /// Create a copy of CharacterPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InfoCopyWith<$Res> get info {
    return $InfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterPageResponseImplCopyWith<$Res>
    implements $CharacterPageResponseCopyWith<$Res> {
  factory _$$CharacterPageResponseImplCopyWith(
    _$CharacterPageResponseImpl value,
    $Res Function(_$CharacterPageResponseImpl) then,
  ) = __$$CharacterPageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Info info, List<Character> results});

  @override
  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$CharacterPageResponseImplCopyWithImpl<$Res>
    extends
        _$CharacterPageResponseCopyWithImpl<$Res, _$CharacterPageResponseImpl>
    implements _$$CharacterPageResponseImplCopyWith<$Res> {
  __$$CharacterPageResponseImplCopyWithImpl(
    _$CharacterPageResponseImpl _value,
    $Res Function(_$CharacterPageResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CharacterPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? info = null, Object? results = null}) {
    return _then(
      _$CharacterPageResponseImpl(
        info: null == info
            ? _value.info
            : info // ignore: cast_nullable_to_non_nullable
                  as Info,
        results: null == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<Character>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterPageResponseImpl implements _CharacterPageResponse {
  const _$CharacterPageResponseImpl({
    required this.info,
    required final List<Character> results,
  }) : _results = results;

  factory _$CharacterPageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterPageResponseImplFromJson(json);

  @override
  final Info info;
  final List<Character> _results;
  @override
  List<Character> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'CharacterPageResponse(info: $info, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterPageResponseImpl &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    info,
    const DeepCollectionEquality().hash(_results),
  );

  /// Create a copy of CharacterPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterPageResponseImplCopyWith<_$CharacterPageResponseImpl>
  get copyWith =>
      __$$CharacterPageResponseImplCopyWithImpl<_$CharacterPageResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterPageResponseImplToJson(this);
  }
}

abstract class _CharacterPageResponse implements CharacterPageResponse {
  const factory _CharacterPageResponse({
    required final Info info,
    required final List<Character> results,
  }) = _$CharacterPageResponseImpl;

  factory _CharacterPageResponse.fromJson(Map<String, dynamic> json) =
      _$CharacterPageResponseImpl.fromJson;

  @override
  Info get info;
  @override
  List<Character> get results;

  /// Create a copy of CharacterPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterPageResponseImplCopyWith<_$CharacterPageResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
