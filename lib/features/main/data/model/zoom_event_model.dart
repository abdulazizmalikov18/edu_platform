import 'package:edu_platform/features/main/domain/entity/zoom_event_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'zoom_event_model.g.dart';

@JsonSerializable()
class ZoomModel extends ZoomEntity {
  const ZoomModel({super.createRoom});

  factory ZoomModel.fromJson(Map<String, dynamic> json) => _$ZoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$ZoomModelToJson(this);
}
