import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../componentes/botao.dart';
import '../componentes/caixa_variacao_bitcoin copy.dart';
import '../modelos/navegacao_valores.dart';

class TelaBitcoin extends StatefulWidget {
  const TelaBitcoin({super.key});

  @override
  State<TelaBitcoin> createState() => _TelaBitcoinState();
}

class _TelaBitcoinState extends State<TelaBitcoin> {
  @override
  Widget build(BuildContext context) {
    final a = ModalRoute.of(context)!.settings.arguments as NavegacaoValor;
    navegarTelaPrincipal() {
      Navigator.pushNamed(context, '/telaPrincipal', arguments: a);
    }

    criaBody() {
      return Column(
        children: [
          const Center(
            heightFactor: 2,
            child: Text('BitCoin',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            width: 500,
            height: 190,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'Blockchain.info',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      'Coinbase',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(double.parse(a.blockChain).toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponenteBitcoin(valor: a.blockChainValor),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(double.parse(a.coinBase).toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponenteBitcoin(valor: a.coinBaseValor),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      'Bitstamp',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Text(
                      'Foxbit',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    
                    Text(double.parse(a.bitStamp).toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                            
                    ValorComponenteBitcoin(valor: a.bitStampValor),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(double.parse(a.foxBit).toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponenteBitcoin(valor: a.foxBitValor),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      'Mercado Bitcoin',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 186,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(double.parse(a.mercadoBitcoin).toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponenteBitcoin(valor: a.mercadoBitcoinValor),
                  ],
                ),
              ],
            ),
          ),
          Row(children: [
            const SizedBox(
              width: 460,
            ),
            Botao(
              texto: 'Página Inicial',
              funcao: navegarTelaPrincipal,
            )
          ]),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finanças de Hoje'),
        backgroundColor: const Color.fromARGB(255, 0, 75, 39),
      ),
      body: criaBody(),
    );
  }
}
