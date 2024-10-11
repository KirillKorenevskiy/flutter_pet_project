import 'package:dio/dio.dart';
import 'package:finance_manager/coins_item.dart';
import 'package:finance_manager/repositories/crypto_coins/abstract_coins_repo.dart';
import 'package:finance_manager/repositories/crypto_coins/crypto_coins_repo.dart';
import 'package:finance_manager/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:finance_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import 'bloc/coins_list/crypto_list_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CryptoCoinAdapter());

  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>('crypto_coins_box');

  GetIt.I.registerSingleton<AbstarctCoinsRepo>(
      CryptoCoinsRepository(dio: Dio(), cryptoCoinsBox: cryptoCoinsBox));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        scaffoldBackgroundColor: const Color.fromARGB(255, 29, 29, 29),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 29, 29, 30),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        dividerColor: Colors.white24,
        useMaterial3: true,
      ),
      routes: routes,
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});
  final String title;
  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstarctCoinsRepo>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _cryptoListBloc.add(LoadCryptoList());
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                separatorBuilder: (context, i) => const Divider(),
                itemCount: state.coinsList.length,
                itemBuilder: (context, i) {
                  final coin = state.coinsList[i];
                  return CoinItem(coin: coin);
                },
              );
            }
            if (state is CryptoListLoadingFailure) {
              return Center(
                child: Text(
                  state.exeption.toString(),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
