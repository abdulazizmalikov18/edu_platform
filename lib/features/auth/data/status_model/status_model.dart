import 'package:edu_platform/features/auth/domain/entity/status_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status_model.g.dart';

@JsonSerializable()
class StatusModel extends StatusEntity {
  //  "status":"We sent an SMS"

  //  "message":"Please enter the verification code",

  StatusModel({
    super.status,
    super.message,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);

  @override
  String toString() {
    return """status: $status,\nmessage:$message""";
  }
}
