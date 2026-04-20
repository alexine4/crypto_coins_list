import 'package:crypto_coins_list/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    CryptoCoinsRepository()
        .fetchCryptoCoins()
        .then((coins) {
          setState(() {
            _cryptoCoinsList = coins;
          });
          // Handle the fetched coins here, e.g., update the state to display them
          print(coins);
        })
        .catchError((error) {
          // Handle any errors that occur during the fetch
          print('Error fetching crypto coins: $error');
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: _cryptoCoinsList?.length ?? 0,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return CryptoCoinTile(coin: _cryptoCoinsList![index]);
              },
            ),
    );
  }
}
