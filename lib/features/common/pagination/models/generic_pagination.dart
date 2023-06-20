import 'package:json_annotation/json_annotation.dart';

part 'generic_pagination.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GenericPagination<T> {
  @JsonKey(name: 'status')
  final int? code;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data', defaultValue: [])
  final List<T> data;
  @JsonKey(name: 'totalCount')
  final int? totalCount;
  @JsonKey(name: 'page')
  final String? page;
  @JsonKey(name: 'limit')
  final String? limit;

  GenericPagination({
    required this.code,
    required this.message,
    required this.data,
    required this.totalCount,
    required this.page,
    required this.limit,
  });
  factory GenericPagination.fromJson(
          Map<String, dynamic> json, T Function(Object?) fetch) =>
      _$GenericPaginationFromJson(json, fetch);
}
