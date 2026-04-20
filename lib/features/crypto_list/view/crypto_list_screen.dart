import 'dart:async';

import 'package:crypto_coins_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(
    coinsRepository: GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoCoinsEvent());
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
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer<void>();
          _cryptoListBloc.add(LoadCryptoCoinsEvent(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListBlocState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListBlocLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CryptoListBlocLoaded) {
              final cryptoCoinsList = state.cryptoCoinsList;
              return ListView.separated(
                itemCount: cryptoCoinsList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return CryptoCoinTile(coin: cryptoCoinsList[index]);
                },
              );
            } else if (state is CryptoListBlocError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Something went wrong...',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Please try again later.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        _cryptoListBloc.add(LoadCryptoCoinsEvent());
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      /* (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: _cryptoCoinsList?.length ?? 0,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return CryptoCoinTile(coin: _cryptoCoinsList![index]);
              },
            ), */
    );
  }
}
