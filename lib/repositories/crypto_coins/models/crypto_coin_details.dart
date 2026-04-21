import 'package:crypto_coins_list/repositories/crypto_coins/models/image_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@JsonSerializable(explicitToJson: true)
class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails({
    required this.name,
    required this.actualPrice,
    required this.maxPriceBy24h,
    required this.minPriceBy24h,
    required this.image,
  });

  factory CryptoCoinDetails.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoCoinDetailsToJson(this);

  final String name;
  @JsonKey(name: 'current_price')
  final double actualPrice;
  @JsonKey(name: 'high_24h')
  final double maxPriceBy24h;
  @JsonKey(name: 'low_24h')
  final double minPriceBy24h;
  @JsonKey(name: 'image', fromJson: parseImage)
  final ImageDto image;

  static ImageDto parseImage(dynamic image) {
    if (image is Map<String, dynamic>) {
      return ImageDto.fromJson(image);
    }
    final url = image as String? ?? '';
    return ImageDto(thumb: url, small: url, large: url);
  }

  @override
  List<Object?> get props => [
    name,
    actualPrice,
    maxPriceBy24h,
    minPriceBy24h,
    image,
  ];
}
