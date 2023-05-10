import 'package:flutter/material.dart';
import '/telas/tela_financas.dart';
import 'telas/tela_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/telaPrincipal',
      routes: {
        '/telaPrincipal': (context) => TelaPrincipal(),
        '/telaFinanças': (context) => TelaFinancas(),
      },
    );
  }
}
