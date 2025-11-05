import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Ecran3 extends StatelessWidget {
  const Ecran3({super.key});

  Future<List<dynamic>> loadTasks() async {
    final String jsonString = await rootBundle.loadString('assets/tasks.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap['tasks'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: loadTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Aucune tâche trouvée.'));
        }

        final tasks = snapshot.data!;
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${task['id']}'),
                ),
                title: Text(task['title']),
                subtitle: Text('Difficulté : ${task['difficulty']} | Heures : ${task['nbhours']}'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(task['title']),
                      content: Text(task['description']),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Fermer'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
