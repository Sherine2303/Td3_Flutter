import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _tagsController = TextEditingController();
  final _difficultyController = TextEditingController();
  final _hoursController = TextEditingController();

  void _submitTask() {
    if (_formKey.currentState!.validate()) {
      final newTask = Task(
        id: Task.nb + 1, // incrémentation manuelle
        title: _titleController.text,
        description: _descController.text,
        tags: _tagsController.text.split(" "), // tags séparés par espace
        nbhours: int.tryParse(_hoursController.text) ?? 0,
        difficulty: int.tryParse(_difficultyController.text) ?? 0,
        color: Colors.lightBlue,
      );

      Navigator.pop(context, newTask); // renvoie la tâche au parent
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une tâche')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Titre'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Entrez un titre' : null,
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: _tagsController,
                decoration: const InputDecoration(
                  labelText: 'Tags (séparés par espace)',
                ),
              ),
              TextFormField(
                controller: _difficultyController,
                decoration: const InputDecoration(
                  labelText: 'Difficulté (0-5)',
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _hoursController,
                decoration: const InputDecoration(labelText: 'Nombre d’heures'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitTask,
                child: const Text("Ajouter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
