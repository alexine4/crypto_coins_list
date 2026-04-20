import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<CryptoCoin>> fetchCryptoCoins() async {
    final response = await dio.get(
      'https://api.coingecko.com/api/v3/coins/markets',
      queryParameters: {'vs_currency': 'usd', 'ids': 'bitcoin,ethereum,solana'},
    );

    final coins = (response.data as List).map((coin) {
      return CryptoCoin(
        id: coin['id'] as String? ?? '',
        name: (coin['symbol'] as String?)?.toUpperCase() ?? '',
        price: (coin['current_price'] as num?)?.toDouble() ?? 0,
        logoUrl: coin['image'] as String? ?? '',
      );
    }).toList();
    return coins;
  }

  @override
  Future<CryptoCoinDetails> fetchCoinDetails(String coinId) async {
    final response = await dio.get(
      'https://api.coingecko.com/api/v3/coins/$coinId',
      queryParameters: {
        'localization': 'false',
        'tickers': 'false',
        'community_data': 'false',
        'developer_data': 'false',
      },
    );

    final coin = response.data as Map<String, dynamic>;
    final marketData = coin['market_data'] as Map<String, dynamic>?;

    return CryptoCoinDetails(
      name: (coin['symbol'] as String?)?.toUpperCase() ?? '',
      actualPrice:
          (marketData?['current_price']?['usd'] as num?)?.toDouble() ?? 0,
      maxPriceBy24h: (marketData?['high_24h']?['usd'] as num?)?.toDouble() ?? 0,
      minPriceBy24h: (marketData?['low_24h']?['usd'] as num?)?.toDouble() ?? 0,
      logoUrl:
          (coin['image'] as Map<String, dynamic>?)?['large'] as String? ?? '',
    );
  }
}
