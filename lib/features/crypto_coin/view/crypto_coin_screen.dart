import 'dart:async';

import 'package:crypto_coins_list/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:crypto_coins_list/features/crypto_coin/widgets/widgets.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_coins_list/shared/widgets/error_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinId;
  String coinName = 'Unknown Coin';
  CryptoCoinDetailsBloc? _cryptoCoinBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_cryptoCoinBloc != null) return;

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    assert(args != null, 'No arguments provided to CryptoCoinScreen');
    coinId = args?['coinId'] as String? ?? '';
    coinName = args?['coinName'] as String? ?? 'Unknown Coin';

    _cryptoCoinBloc = CryptoCoinDetailsBloc(
      coinsRepository: GetIt.I<AbstractCoinsRepository>(),
      coinId: coinId!,
    );
    _cryptoCoinBloc!.add(LoadCryptoCoinDetailsEvent());
  }

  @override
  void dispose() {
    _cryptoCoinBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName)),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer<void>();
          _cryptoCoinBloc!.add(
            LoadCryptoCoinDetailsEvent(completer: completer),
          );
          return completer.future;
        },
        child: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinState>(
          bloc: _cryptoCoinBloc!,
          builder: (context, state) {
            if (state is CryptoCoinLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CryptoCoinLoaded) {
              final details = state.cryptoCoinsDetails.first;
              return ListView(
                children: [
                  Center(child: CryptoCoinDetailsTile(coinDetails: details)),
                ],
              );
            } else if (state is CryptoCoinError) {
              return ErrorStateWidget(
                onRetry: () {
                  _cryptoCoinBloc!.add(LoadCryptoCoinDetailsEvent());
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
