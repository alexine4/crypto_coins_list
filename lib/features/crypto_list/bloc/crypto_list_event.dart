part of 'crypto_list_bloc.dart';

abstract class CryptoListBlocEvent extends Equatable {}

class LoadCryptoCoinsEvent extends CryptoListBlocEvent {
  LoadCryptoCoinsEvent({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
