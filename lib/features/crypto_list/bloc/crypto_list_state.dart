part of 'crypto_list_bloc.dart';

abstract class CryptoListBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CryptoListBlocInitial extends CryptoListBlocState {}

class CryptoListBlocLoading extends CryptoListBlocState {}

class CryptoListBlocLoaded extends CryptoListBlocState {
  CryptoListBlocLoaded({required this.cryptoCoinsList});
  final List<CryptoCoin> cryptoCoinsList;

  @override
  List<Object?> get props => [cryptoCoinsList];
}

class CryptoListBlocError extends CryptoListBlocState {
  CryptoListBlocError({required this.exception});
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
