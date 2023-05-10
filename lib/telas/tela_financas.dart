import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prova_clavison/modelos/navegacao_valores.dart';

import '../componentes/caixa_variacao.dart';
import '../componentes/caixa_variacao_acoes.dart';

class TelaFinancas extends StatefulWidget {
  const TelaFinancas({super.key});

  @override
  State<TelaFinancas> createState() => _TelaFinancasState();
}

class _TelaFinancasState extends State<TelaFinancas> {
  @override
  
  Widget build(BuildContext context) {
     final a = ModalRoute.of(context)!.settings.arguments as NavegacaoValor;

    voltar() {
      Navigator.pop(context);
    }
    
  criaBody() {
    return Column(
        children: [
          const Center(
            heightFactor: 2,
            child: Text('Ações',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            width: 500,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text('IBOVESPA',style: TextStyle(fontSize: 20),),
                     SizedBox(
                      width: 135,
                    ),
                    Text(
                      'IFIX',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(double.parse(a.ibovespa).toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponenteAcoes(valor: a.ibovespaValor),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(double.parse(a.ifix).toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponenteAcoes(valor: a.ifixValor),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: const [
                    Text('NASDAQ',style: TextStyle(fontSize: 20),),
                     SizedBox(
                      width: 144,
                    ),
                    Text(
                      'DOWJONES',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(double.parse(a.nasdaq).toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponenteAcoes(valor: a.nasdaqValor),
                    const SizedBox(
                      width: 107,
                    ),
                    Text(double.parse(a.downjones).toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponenteAcoes(valor: a.downjonesValor),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: const [
                    Text('CAC',style: TextStyle(fontSize: 20),),
                     SizedBox(
                      width: 186,
                    ),
                    Text(
                      'NIKKEI',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(double.parse(a.cac).toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ValorComponenteAcoes(valor: a.cacValor),
                    const SizedBox(
                      width: 117,
                    ),
                    Text(double.parse(a.nikkei).toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                            ValorComponenteAcoes(valor: a.nikkeiValor),
                  ],
                ),
                
        ],
        ),
    )],
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
