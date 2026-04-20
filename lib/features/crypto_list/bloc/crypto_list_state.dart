part of 'crypto_list_bloc.dart';

class CryptoListBlocState {}

class CryptoListBlocInitial extends CryptoListBlocState {}

class CryptoListBlocLoading extends CryptoListBlocState {}

class CryptoListBlocLoaded extends CryptoListBlocState {
  final List<CryptoCoin> cryptoCoinsList;

  CryptoListBlocLoaded({required this.cryptoCoinsList});
}

class CryptoListBlocError extends CryptoListBlocState {
  final Object? exception;

  CryptoListBlocError({required this.exception});
}
