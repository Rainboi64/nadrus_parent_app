// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detect_tenant_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetectTenantResponse _$DetectTenantResponseFromJson(Map<String, dynamic> json) {
  return _DetectTenantResponse.fromJson(json);
}

/// @nodoc
mixin _$DetectTenantResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get studentUsername => throw _privateConstructorUsedError;
  String? get tenantId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetectTenantResponseCopyWith<DetectTenantResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectTenantResponseCopyWith<$Res> {
  factory $DetectTenantResponseCopyWith(DetectTenantResponse value,
          $Res Function(DetectTenantResponse) then) =
      _$DetectTenantResponseCopyWithImpl<$Res, DetectTenantResponse>;
  @useResult
  $Res call({int? id, String? studentUsername, String? tenantId});
}

/// @nodoc
class _$DetectTenantResponseCopyWithImpl<$Res,
        $Val extends DetectTenantResponse>
    implements $DetectTenantResponseCopyWith<$Res> {
  _$DetectTenantResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentUsername = freezed,
    Object? tenantId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentUsername: freezed == studentUsername
          ? _value.studentUsername
          : studentUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetectTenantResponseCopyWith<$Res>
    implements $DetectTenantResponseCopyWith<$Res> {
  factory _$$_DetectTenantResponseCopyWith(_$_DetectTenantResponse value,
          $Res Function(_$_DetectTenantResponse) then) =
      __$$_DetectTenantResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? studentUsername, String? tenantId});
}

/// @nodoc
class __$$_DetectTenantResponseCopyWithImpl<$Res>
    extends _$DetectTenantResponseCopyWithImpl<$Res, _$_DetectTenantResponse>
    implements _$$_DetectTenantResponseCopyWith<$Res> {
  __$$_DetectTenantResponseCopyWithImpl(_$_DetectTenantResponse _value,
      $Res Function(_$_DetectTenantResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentUsername = freezed,
    Object? tenantId = freezed,
  }) {
    return _then(_$_DetectTenantResponse(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentUsername: freezed == studentUsername
          ? _value.studentUsername
          : studentUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetectTenantResponse implements _DetectTenantResponse {
  const _$_DetectTenantResponse({this.id, this.studentUsername, this.tenantId});

  factory _$_DetectTenantResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DetectTenantResponseFromJson(json);

  @override
  final int? id;
  @override
  final String? studentUsername;
  @override
  final String? tenantId;

  @override
  String toString() {
    return 'DetectTenantResponse(id: $id, studentUsername: $studentUsername, tenantId: $tenantId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetectTenantResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentUsername, studentUsername) ||
                other.studentUsername == studentUsername) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, studentUsername, tenantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetectTenantResponseCopyWith<_$_DetectTenantResponse> get copyWith =>
      __$$_DetectTenantResponseCopyWithImpl<_$_DetectTenantResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetectTenantResponseToJson(
      this,
    );
  }
}

abstract class _DetectTenantResponse implements DetectTenantResponse {
  const factory _DetectTenantResponse(
      {final int? id,
      final String? studentUsername,
      final String? tenantId}) = _$_DetectTenantResponse;

  factory _DetectTenantResponse.fromJson(Map<String, dynamic> json) =
      _$_DetectTenantResponse.fromJson;

  @override
  int? get id;
  @override
  String? get studentUsername;
  @override
  String? get tenantId;
  @override
  @JsonKey(ignore: true)
  _$$_DetectTenantResponseCopyWith<_$_DetectTenantResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
