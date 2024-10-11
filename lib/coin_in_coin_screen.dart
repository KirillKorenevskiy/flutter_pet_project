import 'package:flutter/material.dart';

class CoinInCoinScreen extends StatefulWidget {
  const CoinInCoinScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });
  final String? image;
  final String? name;
  final double? price;

  @override
  State<CoinInCoinScreen> createState() => _CoinInCoinScreenState();
}

class _CoinInCoinScreenState extends State<CoinInCoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 29, 29, 30),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              )
            ],
          ),
          child: ListTile(
            leading: Image.network(widget.image as String),
            title: Text(
              widget.name as String,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              '${widget.price} \$',
              style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            trailing: const Text(
              '↑12%',
              style: TextStyle(color: Colors.lightGreenAccent, fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
