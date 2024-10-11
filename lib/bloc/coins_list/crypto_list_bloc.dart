import 'package:finance_manager/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/crypto_coins/abstract_coins_repo.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepo) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        final cryptoCoinsListt = await coinsRepo.getCoinsList();
        emit(CryptoListLoaded(coinsList: cryptoCoinsListt));
      } catch (e) {
        emit(CryptoListLoadingFailure(exeption: e));
      }
    });
  }

  final AbstarctCoinsRepo coinsRepo;
}
