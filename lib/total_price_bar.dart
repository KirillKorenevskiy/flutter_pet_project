import 'package:flutter/material.dart';

class TotalPriceBar extends StatelessWidget {
  const TotalPriceBar({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(left: 20, top: 240, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Итого: ${price.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
          SizedBox(
            width: 120,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade500,
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              child: const Text(
                'Купить',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
