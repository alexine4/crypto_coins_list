import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';

@JsonSerializable()
class ImageDto {
  ImageDto({required this.thumb, required this.small, required this.large});

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);

  final String thumb;
  final String small;
  final String large;
}
