import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/task.dart';

class MyAPI {
  /// Lecture des tâches depuis un fichier JSON local (assets/tasks.json)
  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(seconds: 1)); // Simule un délai

    try {
      final dataString = await _loadAsset('assets/tasks.json');
      final Map<String, dynamic> json = jsonDecode(dataString);

      if (json.containsKey('tasks') && json['tasks'] is List) {
        final tasks = (json['tasks'] as List)
            .map((e) => Task.fromJson(e as Map<String, dynamic>))
            .toList();
        return tasks;
      } else {
        return [];
      }
    } catch (e) {
      print('Erreur lors du chargement des tâches : $e');
      return [];
    }
  }

  /// Chargement du fichier JSON depuis les assets
  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }
}

