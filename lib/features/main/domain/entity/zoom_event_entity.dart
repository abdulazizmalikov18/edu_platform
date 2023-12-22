import 'package:edu_platform/features/main/data/model/zoom_event_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ZoomEntity extends Equatable {
  final String createRoom;

  const ZoomEntity({
    this.createRoom = "",
  });

  @override
  List<Object?> get props => [
        createRoom,
      ];
}

class ZoomConverter implements JsonConverter<ZoomEntity, Map<String, dynamic>?> {
  const ZoomConverter();
  @override
  ZoomEntity fromJson(Map<String, dynamic>? json) => ZoomModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(ZoomEntity object) => {};
}
