import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListBlocEvent, CryptoListBlocState> {
  CryptoListBloc({required this.coinsRepository})
    : super(CryptoListBlocInitial()) {
    on<CryptoListBlocEvent>((event, emit) async {
      if (state is! CryptoListBlocLoaded) {
        emit(CryptoListBlocLoading());
      }

      try {
        final cryptoCoinsList = await coinsRepository.fetchCryptoCoins();
        emit(CryptoListBlocLoaded(cryptoCoinsList: cryptoCoinsList));
      } catch (e, st) {
        emit(CryptoListBlocError(exception: e));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        if (event is LoadCryptoCoinsEvent && event.completer != null) {
          event.completer?.complete();
        }
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
