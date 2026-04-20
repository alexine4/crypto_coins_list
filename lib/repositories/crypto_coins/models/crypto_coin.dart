import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.id,
    required this.name,
    required this.price,
    required this.logoUrl,
  });

  final String id;
  final String name;
  final double price;
  final String logoUrl;

  @override
  List<Object?> get props => [id, name, price, logoUrl];
}
