import 'package:flutter/material.dart';

class VolunteerDetail extends StatelessWidget {
  final Map<String, dynamic> volunteer;

  const VolunteerDetail({required this.volunteer});

  @override
  Widget build(BuildContext context) {
    // Obtener el color del voluntariado
    final Color volunteerColor = volunteer['color'] as Color;

    return Scaffold(
      appBar: AppBar(
        title: Text(volunteer['name']),
        //backgroundColor: volunteerColor, // Usar el color del voluntariado en el AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen principal
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(volunteer['imageUrl'] ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Sección de Descripción
              _buildSectionTitle('Descripción', Icons.description, volunteerColor),
              const SizedBox(height: 8),
              Text(
                volunteer['description'],
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              Divider(thickness: 2),

              // Sección de Misión
              _buildSectionTitle('Misión', Icons.flag, volunteerColor),
              const SizedBox(height: 8),
              Text(
                volunteer['mission'],
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              Divider(thickness: 2),

              // Sección de Visión
              _buildSectionTitle('Visión', Icons.visibility, volunteerColor),
              const SizedBox(height: 8),
              Text(
                volunteer['vision'],
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              Divider(thickness: 2),

              // Sección de Valores
              _buildSectionTitle('Valores', Icons.star, volunteerColor),
              const SizedBox(height: 8),
              Text(
                volunteer['values'],
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper para construir los títulos de sección con íconos y color dinámico
  Widget _buildSectionTitle(String title, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
