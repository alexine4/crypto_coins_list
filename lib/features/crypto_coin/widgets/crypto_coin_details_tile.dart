import 'package:crypto_coins_list/repositories/crypto_coins/models/models.dart';
import 'package:flutter/material.dart';

class CryptoCoinDetailsTile extends StatelessWidget {
  const CryptoCoinDetailsTile({super.key, required this.coin});

  final CryptoCoinDetails coin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(coin.image.thumb, width: 80, height: 80),
        const SizedBox(height: 16),
        Text(
          coin.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Text(
          'Price: \$${coin.actualPrice}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 8),
        Text(
          '24h High: \$${coin.maxPriceBy24h}',
          style: const TextStyle(fontSize: 16, color: Colors.green),
        ),
        const SizedBox(height: 8),
        Text(
          '24h Low: \$${coin.minPriceBy24h}',
          style: const TextStyle(fontSize: 16, color: Colors.red),
        ),
      ],
    );
  }
}
