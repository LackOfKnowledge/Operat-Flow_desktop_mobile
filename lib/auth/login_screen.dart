import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/auth/forgot_password_screen.dart';
import 'package:operat_flow/auth/registration_screen.dart'; // Dodaj import RegistrationScreen
import 'package:operat_flow/dashboard_screen.dart';
import 'package:operat_flow/theme.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement actual login logic (check credentials)
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');

      // --- Mock Login ---
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
      // ------------------
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: baseBackground,
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
                    // --- Logo Placeholder ---
                    Container(
                      width: 64,
                      height: 64,
                      margin: const EdgeInsets.only(bottom: 32.0),
                      decoration: BoxDecoration(
                        color: successColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'OF',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                    // ------------------------
                    Text(
                      'Witaj z powrotem!',
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Zaloguj się, aby kontynuować.',
                      style:
                      textTheme.bodyMedium?.copyWith(color: secondaryText),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Proszę podać adres e-mail';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Proszę podać poprawny adres e-mail';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Hasło',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                          onPressed: _togglePasswordVisibility,
                          tooltip: _obscurePassword
                              ? 'Pokaż hasło'
                              : 'Ukryj hasło',
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Proszę podać hasło';
                        }
                        // TODO: Dodać bardziej złożoną walidację hasła
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                          );
                        },
                        child: const Text('Zapomniałeś hasła?'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Zaloguj się'),
                    ),
                    const SizedBox(height: 32),
                    // TODO: Dodać logowanie przez Google/Microsoft
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Nawigacja do ekranu rejestracji
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                const RegistrationScreen()),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Nie masz konta? ',
                            style: textTheme.bodyMedium
                                ?.copyWith(color: secondaryText),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Zarejestruj się',
                                style: TextStyle(
                                  color: colorScheme.secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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