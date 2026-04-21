// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetails _$CryptoCoinDetailsFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetails(
      name: json['name'] as String,
      actualPrice: (json['current_price'] as num).toDouble(),
      maxPriceBy24h: (json['high_24h'] as num).toDouble(),
      minPriceBy24h: (json['low_24h'] as num).toDouble(),
      image: CryptoCoinDetails.parseImage(json['image']),
    );

Map<String, dynamic> _$CryptoCoinDetailsToJson(CryptoCoinDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'current_price': instance.actualPrice,
      'high_24h': instance.maxPriceBy24h,
      'low_24h': instance.minPriceBy24h,
      'image': instance.image.toJson(),
    };
