import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/database/database.dart';
import 'package:operat_flow/theme.dart';
import 'package:operat_flow/constants/form_constants.dart';

class NewProjectDialog extends ConsumerStatefulWidget {
  const NewProjectDialog({super.key});

  @override
  ConsumerState<NewProjectDialog> createState() => _NewProjectDialogState();
}

class _NewProjectDialogState extends ConsumerState<NewProjectDialog> {
  final _formKey = GlobalKey<FormState>();

  final _kergController = TextEditingController();
  final _clientNameController = TextEditingController();
  final _communeController = TextEditingController();
  final _precinctController = TextEditingController();
  final _plotNumbersController = TextEditingController();

  String? _selectedWorkType;
  String? _selectedVoivodeship;
  String? _selectedCoordSystem;
  String? _selectedHeightSystem;

  @override
  void dispose() {
    _kergController.dispose();
    _clientNameController.dispose();
    _communeController.dispose();
    _precinctController.dispose();
    _plotNumbersController.dispose();
    super.dispose();
  }

  Future<void> _saveProject() async {
    if (_formKey.currentState!.validate()) {
      final db = ref.read(databaseProvider);

      final newProject = ProjectsCompanion(
        kerg: d.Value(_kergController.text),
        workType: d.Value(_selectedWorkType!),
        clientName: d.Value(_clientNameController.text),
        locationVoivodeship: d.Value(_selectedVoivodeship!),
        locationCommune: d.Value(_communeController.text),
        locationPrecinct: d.Value(_precinctController.text),
        locationPlotNumbers: d.Value(_plotNumbersController.text),
        coordSystem: d.Value(_selectedCoordSystem!),
        heightSystem: d.Value(_selectedHeightSystem!),
      );

      try {
        await db.insertProject(newProject);
        if (mounted) {
          Navigator.of(context).pop();
        }
      } catch (e) {
        // TODO: Obsłużyć błąd (np. unikalny KERG) i pokazać go użytkownikowi
        print('Błąd zapisu projektu: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Błąd zapisu: $e'),
            backgroundColor: errorColor,
          ),
        );
      }
    }
  }

  String? _validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Pole "$fieldName" jest wymagane';
    }
    return null;
  }

  String? _validateDropdown(String? value, String fieldName) {
    if (value == null) {
      return 'Należy wybrać "$fieldName"';
    }
    return null;
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List<String> items) {
    return items
        .map((item) => DropdownMenuItem(
      value: item,
      child: Text(item),
    ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Utwórz Nowy Projekt'),
      content: ConstrainedBox(
        constraints:
        const BoxConstraints(maxWidth: 600, minWidth: 400),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dane Podstawowe',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _kergController,
                  decoration: const InputDecoration(labelText: 'KERG'),
                  validator: (value) => _validateNotEmpty(value, 'KERG'),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedWorkType,
                  decoration: const InputDecoration(labelText: 'Rodzaj Pracy'),
                  items: _buildDropdownItems(FormConstants.workTypes),
                  menuMaxHeight: 250.0,
                  onChanged: (value) {
                    setState(() {
                      _selectedWorkType = value;
                    });
                  },
                  validator: (value) =>
                      _validateDropdown(value, 'Rodzaj Pracy'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _clientNameController,
                  decoration: const InputDecoration(labelText: 'Klient'),
                  validator: (value) => _validateNotEmpty(value, 'Klient'),
                ),
                const Divider(height: 32),

                Text('Lokalizacja',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedVoivodeship,
                        decoration:
                        const InputDecoration(labelText: 'Województwo'),
                        items:
                        _buildDropdownItems(FormConstants.voivodeships),
                        menuMaxHeight: 250.0,
                        onChanged: (value) {
                          setState(() {
                            _selectedVoivodeship = value;
                          });
                        },
                        validator: (value) =>
                            _validateDropdown(value, 'Województwo'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _communeController,
                        decoration: const InputDecoration(labelText: 'Gmina'),
                        validator: (value) =>
                            _validateNotEmpty(value, 'Gmina'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _precinctController,
                        decoration: const InputDecoration(labelText: 'Obręb'),
                        validator: (value) =>
                            _validateNotEmpty(value, 'Obręb'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _plotNumbersController,
                        decoration:
                        const InputDecoration(labelText: 'Numery Działek'),
                        validator: (value) =>
                            _validateNotEmpty(value, 'Numery Działek'),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 32),

                Text('Ustawienia Techniczne',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedCoordSystem,
                        decoration: const InputDecoration(
                            labelText: 'Układ Współrzędnych'),
                        items: _buildDropdownItems(
                            FormConstants.coordinateSystems),
                        menuMaxHeight: 250.0,
                        onChanged: (value) {
                          setState(() {
                            _selectedCoordSystem = value;
                          });
                        },
                        validator: (value) =>
                            _validateDropdown(value, 'Układ Współrzędnych'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedHeightSystem,
                        decoration: const InputDecoration(
                            labelText: 'Układ Wysokościowy'),
                        items: _buildDropdownItems(
                            FormConstants.heightSystems),
                        menuMaxHeight: 250.0,
                        onChanged: (value) {
                          setState(() {
                            _selectedHeightSystem = value;
                          });
                        },
                        validator: (value) =>
                            _validateDropdown(value, 'Układ Wysokościowy'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Anuluj'),
        ),
        ElevatedButton(
          onPressed: _saveProject,
          child: const Text('Utwórz Projekt'),
        ),
      ],
    );
  }
}