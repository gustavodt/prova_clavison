import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ValorComponente extends StatelessWidget {
  final double valor;

  ValorComponente({required this.valor});

  Color _getCor() {
    if (valor > 0) {
      return Colors.blue;
    } else if (valor < 0) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: _getCor(),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Text(
        valor.toStringAsFixed(4),
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
