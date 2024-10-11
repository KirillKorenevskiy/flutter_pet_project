import 'package:hive_flutter/adapters.dart';

part 'crypto_coin_model.g.dart';

@HiveType(typeId: 0)
class CryptoCoin {
  const CryptoCoin({
    required this.name,
    required this.priceUSD,
    required this.imageUrl,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final double priceUSD;
  @HiveField(2)
  final String imageUrl;
}
