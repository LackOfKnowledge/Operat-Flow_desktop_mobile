import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/theme.dart';
import 'package:operat_flow/auth/login_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OperatFlow',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperatFlow Dashboard'),
      ),
      body: const Center(
        child: Text('Główny widok aplikacji - w budowie...'),
      ),
    );
  }
}