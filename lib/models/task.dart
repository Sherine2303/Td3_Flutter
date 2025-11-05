import 'package:flutter/material.dart';

class Task {
  final int id;
  final String title;
  final List<String> tags;
  final int nbhours;
  final int difficulty;
  final String description;
  final Color color;

  Task({
    required this.id,
    required this.title,
    required this.tags,
    required this.nbhours,
    required this.difficulty,
    required this.description,
    required this.color,
  });

  // Méthode statique pour générer une liste de tâches fictives
  static List<Task> generateTask(int count) {
    return List.generate(count, (index) {
      return Task(
        id: index,
        title: 'title $index',
        tags: ['tag $index', 'tag ${index + 1}'],
        nbhours: index,
        difficulty: index % 5,
        description: 'Description de la tâche $index',
        color: Colors.lightBlue,
      );
    });
  }

  // Méthode pour convertir un JSON en objet Task
  static Task fromJson(Map<String, dynamic> json) {
    final tags = (json['tags'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList() ?? [];

    // Gestion de la couleur encodée en hexadécimal (ex: "0xFF42A5F5")
    final colorHex = json['color'] as String?;
    final color = colorHex != null
        ? Color(int.parse(colorHex))
        : Colors.greenAccent;

    return Task(
      id: json['id'] as int,
      title: json['title'] as String,
      tags: tags,
      nbhours: json['nbhours'] as int,
      difficulty: json['difficulty'] as int,
      description: json['description'] as String,
      color: color,
    );
  }
}