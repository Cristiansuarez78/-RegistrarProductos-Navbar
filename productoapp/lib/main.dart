import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Ajustar la ruta aquí

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Productos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(), // Pantalla principal
      debugShowCheckedModeBanner: false,
    );
  }
}
