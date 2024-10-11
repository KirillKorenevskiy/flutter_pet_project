import 'package:finance_manager/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';

class CoinItem extends StatelessWidget {
  const CoinItem({super.key, required this.coin});
  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(coin.imageUrl),
      title: Text(
        coin.name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        '${coin.priceUSD} \$',
        style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.6),
            fontWeight: FontWeight.w500,
            fontSize: 16),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 25,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: {
            'name': coin.name,
            'priceUSD': coin.priceUSD,
            'image': coin.imageUrl,
          },
        );
      },
    );
  }
}
