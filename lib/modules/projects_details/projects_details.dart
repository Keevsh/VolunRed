import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  final Map<String, dynamic> project; // Cambiar a Map

  ProjectDetailPage({
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project['title']), // Acceso al título desde el mapa
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              project['imageUrl'], // Acceso a la URL de la imagen
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                project['detailedDescription'], // Acceso a la descripción detallada
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
