part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinEvent extends Equatable {}

class LoadCryptoCoinDetailsEvent extends CryptoCoinEvent {
  LoadCryptoCoinDetailsEvent({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
