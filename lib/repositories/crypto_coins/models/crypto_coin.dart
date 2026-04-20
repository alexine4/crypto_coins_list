import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.price,
    required this.logoUrl,
  });

  final String name;
  final double price;
  final String logoUrl;

  @override
  List<Object?> get props => [name, price, logoUrl];
}
