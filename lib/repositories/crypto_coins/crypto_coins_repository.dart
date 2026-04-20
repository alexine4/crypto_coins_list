import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> fetchCryptoCoins() async {
    // CoinGecko returns a lot of data, but we only need the name and price for our app
    final response = await Dio().get(
      'https://api.coingecko.com/api/v3/coins/markets',
      queryParameters: {'vs_currency': 'usd', 'ids': 'bitcoin,ethereum,solana'},
    );

    final coins = (response.data as List).map((coin) {
      return CryptoCoin(
        name: (coin['symbol'] as String?)?.toUpperCase() ?? '',
        price: (coin['current_price'] as num?)?.toDouble() ?? 0,
        logoUrl: coin['image'] as String? ?? '',
      );
    }).toList();
    return coins;
  }
}
