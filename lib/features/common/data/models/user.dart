import 'package:edu_platform/features/common/domain/entity/data_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  const UserModel({
    this.status = 0,
    this.message = '',
    this.data = const DataEntity(),
  });

  final int status;
  final String message;
  @DataEntityConverter()
  final DataEntity data;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  List<Object?> get props => [status, message, data];
}
