import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:prova_clavison/componentes/botao.dart';
import 'package:prova_clavison/componentes/caixa_variacao.dart';
import 'package:prova_clavison/modelos/navegacao_valores.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  void initState() {
    super.initState();
    buscarApi();
  }

  String ibovespa = 'XXXX';
  double ibovespaValor = 0;

  String ifix = 'XXXX';
  double ifixValor= 0;

  String nasdaq = 'XXXX';
  double nasdaqValor = 0;

  String downjones = 'XXXX';
  double downjonesValor = 0;

  String cac = 'XXXX';
  double cacValor = 0;

  String nikkei = 'XXXX';
  double nikkeiValor= 0;

  String blockChain = 'XXXX';
  double blockChainValor= 0;

  String coinBase= 'XXXX';
  double coinBaseValor= 0;

  String bitStamp = 'XXXX';
  double bitStampValor = 0;

  String foxBit = 'XXXX';
  double foxBitValor = 0;

  String mercadoBitcoin = 'XXXX';
  double mercadoBitcoinValor = 0;
  
  String valorDolarString = 'XXXX';
  double valorDolar = 0;
  String valorEuroString = 'XXXX';
  double valorEuro = 0;
  String valorPesoString = 'XXXX';
  double valorPeso = 0;
  String valorYenString = 'XXXX';
  double valorYen = 0;

  Future<void> buscarApi() async {
    String urlHgFinance =
        'https://api.hgbrasil.com/finance?key=24a4d8aa&format=json-cors';

    Response respostaHgFinance = await get(Uri.parse(urlHgFinance));

    Map mapBody = json.decode(respostaHgFinance.body);

    setState(() {
      valorDolarString = '${mapBody['results']['currencies']['USD']['buy']}';
      valorDolar = mapBody['results']['currencies']['USD']['variation'];

      valorEuroString = '${mapBody['results']['currencies']['EUR']['buy']}';
      valorEuro = mapBody['results']['currencies']['EUR']['variation'];

      valorPesoString = '${mapBody['results']['currencies']['ARS']['buy']}';
      valorEuro = mapBody['results']['currencies']['ARS']['variation'];

      valorYenString = '${mapBody['results']['currencies']['JPY']['buy']}';
      valorYen = mapBody['results']['currencies']['JPY']['variation'];

    ibovespa = '${mapBody['results']['stocks']['IBOVESPA']['points']}';
    ibovespaValor = mapBody['results']['stocks']['IBOVESPA']['variation'];
    
    ifix = '${mapBody['results']['stocks']['IFIX']['points']}';
    ifixValor = mapBody['results']['stocks']['IFIX']['variation'];

    nasdaq = '${mapBody['results']['stocks']['NASDAQ']['points']}';
    nasdaqValor = mapBody['results']['stocks']['NASDAQ']['variation'];

    downjones = '${mapBody['results']['stocks']['DOWJONES']['points']}';
    downjonesValor = mapBody['results']['stocks']['DOWJONES']['variation'];

    cac = '${mapBody['results']['stocks']['CAC']['points']}';
    cacValor = mapBody['results']['stocks']['CAC']['variation']; 

    nikkei = '${mapBody['results']['stocks']['NIKKEI']['points']}';
    nikkeiValor = mapBody['results']['stocks']['NIKKEI']['variation']; 

    blockChain = '${mapBody['results']['bitcoin']['blockchain_info']['last']}';
    blockChainValor = mapBody['results']['bitcoin']['blockchain_info']['variation'];

    coinBase = '${mapBody['results']['bitcoin']['coinbase']['last']}';
    coinBaseValor = mapBody['results']['bitcoin']['coinbase']['variation'];

    bitStamp = '${mapBody['results']['bitcoin']['bitstamp']['points']}';
    bitStampValor = mapBody['results']['bitcoin']['bitstamp']['variation'];

    foxBit = '${mapBody['results']['bitcoin']['foxbit']['points']}';
    foxBitValor = mapBody['results']['bitcoin']['foxbit']['variation'];

    mercadoBitcoin = '${mapBody['results']['bitcoin']['mercadobitcoin']['points']}';
    mercadoBitcoinValor = mapBody['results']['bitcoin']['mercadobitcoin']['variation'];
      
    });
  }

  @override
  Widget build(BuildContext context) {
    navegarAcoes() {
      buscarApi();
      NavegacaoValor n = NavegacaoValor(bitStamp, bitStampValor, blockChain, blockChainValor, cac, 
      cacValor, coinBase, coinBaseValor, downjones, downjonesValor, foxBit, foxBitValor, 
      ibovespa, ibovespaValor, ifix, ifixValor, mercadoBitcoin, mercadoBitcoinValor, 
      nasdaq, nasdaqValor, nikkei, nikkeiValor);

      Navigator.pushNamed(context, '/telaFinanças', arguments: n);
    }

    criaBody() {
      return Column(
        children: [
          const Center(
            heightFactor: 2,
            child: Text('MOEDAS',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            width: 500,
            height: 115,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    Text(
                      'Dólar',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      'Euro',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(valorDolarString,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponente(valor: valorDolar),
                    const SizedBox(
                      width: 90,
                    ),
                    Text(valorEuroString,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponente(valor: valorEuro)
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Peso',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      'Yen',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(valorPesoString,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponente(valor: valorPeso),
                    const SizedBox(
                      width: 88,
                    ),
                    Text(valorYenString,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponente(valor: valorYen),
                  ],
                ),
              ],
            ),
          ),
          Row(children: [
            const SizedBox(
              width: 445,
            ),
          Botao(
            texto: 'Ir para Ações',
            funcao: navegarAcoes,
          )
          ]),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finanças de Hoje'),
        backgroundColor: const Color.fromARGB(255, 0, 68, 27),
      ),
      body: criaBody(),
    );
  }
}
