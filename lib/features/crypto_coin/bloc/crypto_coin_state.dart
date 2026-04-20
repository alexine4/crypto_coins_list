part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CryptoCoinInitial extends CryptoCoinState {}

class CryptoCoinLoading extends CryptoCoinState {}

class CryptoCoinLoaded extends CryptoCoinState {
  CryptoCoinLoaded({required this.cryptoCoinsDetails});
  final List<CryptoCoinDetails> cryptoCoinsDetails;

  @override
  List<Object?> get props => [cryptoCoinsDetails];
}

class CryptoCoinError extends CryptoCoinState {
  CryptoCoinError({required this.exception});
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
