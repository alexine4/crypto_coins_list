import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/models.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> fetchCryptoCoins();
  Future<CryptoCoinDetails> fetchCoinDetails(String coinId);
}
