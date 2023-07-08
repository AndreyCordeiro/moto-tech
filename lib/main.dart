import 'package:flutter/material.dart';
import 'package:moto_tech/view/formulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moto Tech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
        // Defina sua paleta de cores personalizada aqui
      ),
      home: const Formulario(),
    );
  }
}
