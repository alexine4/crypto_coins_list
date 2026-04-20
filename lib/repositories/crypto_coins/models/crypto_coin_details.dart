import 'package:equatable/equatable.dart';

class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails({
    required this.name,
    required this.actualPrice,
    required this.maxPriceBy24h,
    required this.minPriceBy24h,
    required this.logoUrl,
  });

  final String name;
  final double actualPrice;
  final double maxPriceBy24h;
  final double minPriceBy24h;
  final String logoUrl;

  @override
  List<Object?> get props => [
    name,
    actualPrice,
    maxPriceBy24h,
    minPriceBy24h,
    logoUrl,
  ];
}
