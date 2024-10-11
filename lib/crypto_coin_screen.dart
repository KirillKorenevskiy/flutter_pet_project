import 'package:finance_manager/coin_in_coin_screen.dart';
import 'package:finance_manager/number_of_coins.dart';
import 'package:finance_manager/total_price_bar.dart';
import 'package:flutter/material.dart';

import 'graphic/graphic_card.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;
  double? priceUSD = 0.7;
  String? image;

  int selectedIndex = -1;

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    coinName = args['name'].toString();
    priceUSD = args['priceUSD'] as double;
    image = args['image'].toString();

    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 22, top: 10, bottom: 15),
                child: Text(
                  '1 $coinName = $priceUSD \$ ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const Text(
            "Week dynamic",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const GraphicCard(),
          CoinInCoinScreen(image: image, name: coinName, price: priceUSD),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Row(
              children: List.generate(4, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: NumberOfCoins(
                    number: (index + 1) * 10,
                    textColor:
                        selectedIndex == index ? Colors.black : Colors.white,
                    backgroundColor: selectedIndex == index
                        ? Colors.white
                        : const Color.fromARGB(255, 29, 29, 30),
                  ),
                );
              }),
            ),
          ),
          TotalPriceBar(price: (priceUSD! * (selectedIndex + 1) * 10)),
        ],
      ),
    );
  }
}
