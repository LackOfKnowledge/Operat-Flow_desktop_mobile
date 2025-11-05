import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/theme.dart';
import 'package:operat_flow/auth/login_screen.dart';

import 'dart:async';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

final InAppLocalhostServer localhostServer = InAppLocalhostServer(
  port: 8080,
  documentRoot: 'assets',
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // --- ZASTOSOWANA SUGESTIA (Try-Catch + Delay) ---
  try {
    await localhostServer.start();
    debugPrint('InAppLocalhostServer uruchomiony na http://127.0.0.1:8080');
    // Dajemy serwerowi chwilę na "wstanie"
    await Future.delayed(const Duration(milliseconds: 150));
  } catch (e) {
    debugPrint('Nie udało się uruchomić InAppLocalhostServer: $e');
  }
  // --------------------------------------------------
  
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