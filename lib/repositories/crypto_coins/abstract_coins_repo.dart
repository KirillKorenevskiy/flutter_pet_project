import 'package:finance_manager/repositories/crypto_coins/models/crypto_coin_model.dart';

abstract class AbstarctCoinsRepo {
  Future<List<CryptoCoin>> getCoinsList();
}
