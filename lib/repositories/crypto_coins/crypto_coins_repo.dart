import 'package:dio/dio.dart';
import 'package:finance_manager/repositories/crypto_coins/abstract_coins_repo.dart';
import 'package:finance_manager/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:hive_flutter/adapters.dart';

class CryptoCoinsRepository implements AbstarctCoinsRepo {
  CryptoCoinsRepository({
    required this.dio,
    required this.cryptoCoinsBox,
  });

  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    var dataList = <CryptoCoin>[];

    try {
      final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AVAX,CAG&tsyms=USD',
      );

      final data = response.data as Map<String, dynamic>;
      final dataRaw = data['RAW'] as Map<String, dynamic>;
      dataList = dataRaw.entries.map((e) {
        final usdData =
            (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
        final price = usdData['PRICE'];
        final imageURL = usdData['IMAGEURL'];

        return CryptoCoin(
          name: e.key,
          priceUSD: price,
          imageUrl: 'https://www.cryptocompare.com/$imageURL',
        );
      }).toList();

      final dataMap = {for (var e in dataList) e.name: e};
      await cryptoCoinsBox.putAll(dataMap);
    } on Exception catch (e) {
      return cryptoCoinsBox.values.toList();
    }

    return dataList;
  }
}
