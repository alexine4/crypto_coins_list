// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoin _$CryptoCoinFromJson(Map<String, dynamic> json) => CryptoCoin(
  id: json['id'] as String,
  name: json['name'] as String,
  currentPrice: (json['current_price'] as num).toDouble(),
  image: json['image'] as String,
  high24h: (json['high_24h'] as num).toDouble(),
  low24h: (json['low_24h'] as num).toDouble(),
);

Map<String, dynamic> _$CryptoCoinToJson(CryptoCoin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'current_price': instance.currentPrice,
      'image': instance.image,
      'high_24h': instance.high24h,
      'low_24h': instance.low24h,
    };
