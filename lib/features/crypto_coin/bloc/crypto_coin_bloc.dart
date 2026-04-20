import 'dart:async';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinDetailsBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  CryptoCoinDetailsBloc({required this.coinsRepository, required this.coinId})
    : super(CryptoCoinInitial()) {
    on<CryptoCoinEvent>((event, emit) async {
      if (state is! CryptoCoinLoaded) {
        emit(CryptoCoinLoading());
      }

      try {
        final cryptoCoinsDetails = await coinsRepository.fetchCoinDetails(
          coinId,
        );
        emit(CryptoCoinLoaded(cryptoCoinsDetails: [cryptoCoinsDetails]));
      } catch (e, st) {
        emit(CryptoCoinError(exception: e));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        if (event is LoadCryptoCoinDetailsEvent && event.completer != null) {
          event.completer?.complete();
        }
      }
    });
  }
  final String coinId;
  final AbstractCoinsRepository coinsRepository;
}
