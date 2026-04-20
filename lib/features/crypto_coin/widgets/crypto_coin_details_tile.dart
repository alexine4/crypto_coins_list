import 'package:crypto_coins_list/repositories/crypto_coins/models/models.dart';
import 'package:flutter/material.dart';

class CryptoCoinDetailsTile extends StatelessWidget {
  const CryptoCoinDetailsTile({super.key, required this.coinDetails});

  final CryptoCoinDetails coinDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(coinDetails.logoUrl, width: 80, height: 80),
        const SizedBox(height: 16),
        Text(
          coinDetails.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Text(
          'Price: \$${coinDetails.actualPrice}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 8),
        Text(
          '24h High: \$${coinDetails.maxPriceBy24h}',
          style: const TextStyle(fontSize: 16, color: Colors.green),
        ),
        const SizedBox(height: 8),
        Text(
          '24h Low: \$${coinDetails.minPriceBy24h}',
          style: const TextStyle(fontSize: 16, color: Colors.red),
        ),
      ],
    );
  }
}
