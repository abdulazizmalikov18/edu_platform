// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericPagination<T> _$GenericPaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GenericPagination<T>(
      code: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
      totalCount: json['totalCount'] as int?,
      page: json['page'] as int?,
      limit: json['limit'] as int?,
    );
