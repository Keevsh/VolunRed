import 'package:flutter/material.dart';
import 'package:volunred_app/models/volunteer.dart'; // Asegúrate de importar el modelo

class VolunteerDetail extends StatelessWidget {
  final Volunteer volunteer;

  const VolunteerDetail({Key? key, required this.volunteer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(volunteer.name), // Accede al nombre del modelo
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
                    image: NetworkImage(volunteer.imageUrl), // Accede a la URL de la imagen
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Sección de Descripción
              _buildSectionTitle('Descripción', Icons.description),
              const SizedBox(height: 8),
              Text(
                volunteer.description, // Accede a la descripción del modelo
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              const Divider(thickness: 2),

              // Sección de Misión
              _buildSectionTitle('Misión', Icons.flag),
              const SizedBox(height: 8),
              Text(
                volunteer.mission, // Accede a la misión del modelo
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              const Divider(thickness: 2),

              // Sección de Visión
              _buildSectionTitle('Visión', Icons.visibility),
              const SizedBox(height: 8),
              Text(
                volunteer.vision, // Accede a la visión del modelo
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              const Divider(thickness: 2),

              // Sección de Valores
              _buildSectionTitle('Valores', Icons.star),
              const SizedBox(height: 8),
              Text(
                volunteer.values, // Accede a los valores del modelo
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper para construir los títulos de sección con íconos y color dinámico con degradado
  Widget _buildSectionTitle(String title, IconData icon) {
    final gradient = const LinearGradient(
      colors: [
        Color(0xFF3D4052), // Primer color del degradado
        Color(0xFF09090C), // Segundo color del degradado
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Row(
      children: [
        // Icono con degradado
        ShaderMask(
          shaderCallback: (bounds) {
            return gradient.createShader(bounds);
          },
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(width: 8),
        // Texto con degradado
        ShaderMask(
          shaderCallback: (bounds) {
            return gradient.createShader(bounds);
          },
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Este color será cubierto por el degradado
            ),
          ),
        ),
      ],
    );
  }
}
