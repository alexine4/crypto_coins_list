import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin.g.dart';

@JsonSerializable()
class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.id,
    required this.name,
    @JsonKey(name: 'current_price') required this.currentPrice,
    required this.image,
    @JsonKey(name: 'high_24h') required this.high24h,
    @JsonKey(name: 'low_24h') required this.low24h,
  });

  factory CryptoCoin.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoCoinToJson(this);

  final String id;
  final String name;
  final double currentPrice;
  final String image;
  final double high24h;
  final double low24h;

  @override
  List<Object?> get props => [id, name, currentPrice, image, high24h, low24h];
}
