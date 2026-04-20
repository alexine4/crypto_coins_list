import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListBlocEvent, CryptoListBlocState> {
  CryptoListBloc({required this.coinsRepository})
    : super(CryptoListBlocInitial()) {
    on<CryptoListBlocEvent>((event, emit) async {
      emit(CryptoListBlocLoading());
      try {
        final cryptoCoinsList = await coinsRepository.fetchCryptoCoins();
        emit(CryptoListBlocLoaded(cryptoCoinsList: cryptoCoinsList));
      } catch (e) {
        emit(CryptoListBlocError(exception: e));
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
