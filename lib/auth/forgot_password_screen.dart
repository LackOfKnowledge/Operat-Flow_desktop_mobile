import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/theme.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendResetLink() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement actual logic to send reset link (call backend API)
      print('Sending reset link to: ${_emailController.text}');

      // Pokaż potwierdzenie (mock)
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Jeśli konto ${_emailController.text} istnieje, wysłano link do resetowania hasła.'),
          backgroundColor: successColor,
        ),
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Proszę podać adres e-mail';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Proszę podać poprawny adres e-mail';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: baseBackground,
      appBar: AppBar(
        title: const Text('Resetuj Hasło'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.lock_reset_outlined, size: 64, color: secondaryText),
                    const SizedBox(height: 24),
                    Text(
                      'Zapomniałeś hasła?',
                      style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Podaj adres e-mail powiązany z Twoim kontem, a wyślemy Ci instrukcje, jak ustawić nowe hasło.',
                      style: textTheme.bodyMedium?.copyWith(color: secondaryText),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Adres e-mail',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _sendResetLink,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        // Można użyć innego koloru, np. secondary, jeśli preferowane
                        // backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                      child: const Text('Wyślij Link Resetujący'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}