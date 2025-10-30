import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/auth/login_screen.dart';
import 'package:operat_flow/theme.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _nipController = TextEditingController();
  final _regonController = TextEditingController();
  final _addressController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _licenseController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _companyNameController.dispose();
    _nipController.dispose();
    _regonController.dispose();
    _addressController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _licenseController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement actual registration logic (send data to backend)
      print('--- Rejestracja ---');
      print('Firma: ${_companyNameController.text}, NIP: ${_nipController.text}');
      print('Admin: ${_firstNameController.text} ${_lastNameController.text}, Email: ${_emailController.text}');
      print('-------------------');

      // Na razie, po "rejestracji", wróć do ekranu logowania z informacją
      Navigator.of(context).pop(); // Wróć do LoginScreen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Rejestracja zakończona pomyślnie (mock). Zaloguj się.'),
          backgroundColor: successColor,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Proszę poprawić błędy w formularzu.'),
          backgroundColor: errorColor,
        ),
      );
    }
  }

  // Prosta walidacja (można rozbudować)
  String? _validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Pole "$fieldName" nie może być puste';
    }
    return null;
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Proszę podać hasło';
    }
    // Walidacja siły hasła (zgodnie z PRD - min 13 znaków)
    // Można dodać bardziej złożone reguły (mała/wielka litera, cyfra, znak specjalny)
    if (value.length < 13) {
      return 'Hasło musi mieć co najmniej 13 znaków';
    }
    // Przykładowa walidacja złożoności (opcjonalnie)
    // if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}|:"<>?~`\-=[\];\',./]).{13,}$').hasMatch(value)) {
    //   return 'Hasło musi zawierać małą/wielką literę, cyfrę i znak specjalny';
    // }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Proszę potwierdzić hasło';
    }
    if (value != _passwordController.text) {
      return 'Hasła nie są zgodne';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: baseBackground,
      appBar: AppBar( // AppBar dla nawigacji wstecz
        title: const Text('Rejestracja Nowej Firmy'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(), // Powrót do LoginScreen
        ),
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // --- Sekcja Dane Firmy ---
                    Text('Dane Firmy', style: textTheme.titleLarge),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _companyNameController,
                      decoration: const InputDecoration(labelText: 'Pełna Nazwa Firmy'),
                      validator: (value) => _validateNotEmpty(value, 'Nazwa Firmy'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _nipController,
                            decoration: const InputDecoration(labelText: 'NIP'),
                            keyboardType: TextInputType.number,
                            validator: (value) => _validateNotEmpty(value, 'NIP'), // TODO: Dokładniejsza walidacja NIP
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _regonController,
                            decoration: const InputDecoration(labelText: 'REGON'),
                            keyboardType: TextInputType.number,
                            validator: (value) => _validateNotEmpty(value, 'REGON'), // TODO: Dokładniejsza walidacja REGON
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(labelText: 'Adres Siedziby'),
                      validator: (value) => _validateNotEmpty(value, 'Adres Siedziby'),
                    ),
                    const SizedBox(height: 32),

                    // --- Sekcja Dane Administratora ---
                    Text('Dane Administratora (Właściciela)', style: textTheme.titleLarge),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstNameController,
                            decoration: const InputDecoration(labelText: 'Imię'),
                            validator: (value) => _validateNotEmpty(value, 'Imię'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _lastNameController,
                            decoration: const InputDecoration(labelText: 'Nazwisko'),
                            validator: (value) => _validateNotEmpty(value, 'Nazwisko'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Adres e-mail (login)',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Telefon',
                              prefixIcon: Icon(Icons.phone_outlined),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) => _validateNotEmpty(value, 'Telefon'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _licenseController,
                            decoration: const InputDecoration(labelText: 'Nr Uprawnień (opcjonalnie)'),
                            // validator: (value) => _validateNotEmpty(value, 'Nazwisko'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Hasło (min. 13 znaków, min. jedna wielka litera, cyfra i znak specjalny)',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        labelText: 'Potwierdź Hasło',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          ),
                          onPressed: _toggleConfirmPasswordVisibility,
                        ),
                      ),
                      validator: _validateConfirmPassword,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Zarejestruj Firmę i Konto'),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Wróć do LoginScreen
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Masz już konto? ',
                            style: textTheme.bodyMedium?.copyWith(color: secondaryText),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Zaloguj się',
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