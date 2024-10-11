import 'package:finance_manager/crypto_coin_screen.dart';
import 'package:finance_manager/main.dart';

final routes = {
  '/': (context) => const CryptoListScreen(title: 'Crypto Application'),
  '/coin': (context) => const CryptoCoinScreen(),
};
