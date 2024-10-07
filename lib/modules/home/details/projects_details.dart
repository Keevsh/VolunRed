import 'package:flutter/material.dart';
import 'package:volunred_app/modules/details/register_projects.dart';

class ProjectDetailPage extends StatelessWidget {
  final Map<String, dynamic> project;

  ProjectDetailPage({
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    // Definir si mostrar el botón "Registrarse" en función del estado del proyecto
    bool showRegisterButton =
        project['status'] == 'Activos' || project['status'] == 'Futuros';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          project['title'],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del proyecto con bordes redondeados
              ClipRRect(
                borderRadius: BorderRadius.circular(16), // Bordes redondeados
                child: Image.network(
                  project['imageUrl'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
              SizedBox(height: 16), // Espacio entre la imagen y el título

              // Título del proyecto
              Text(
                project['title'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8), // Espacio entre el título y la descripción

              // Descripción detallada dentro de un Card con bordes y sombra
              Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Bordes redondeados en la tarjeta
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    project['detailedDescription'],
                    style: TextStyle(fontSize: 16, height: 1.4),
                    textAlign: TextAlign.start, // Justificar el texto
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Mostrar el botón "Registrarse" si el estado es activo o futuro
              if (showRegisterButton)
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.9, // 90% del ancho de la pantalla
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterProjectPage()),
                        );
                        // Acción del botón de registro
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical:
                                16.0), // Mantén el padding vertical constante
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Bordes redondeados del botón
                        ),
                        backgroundColor:
                            Color.fromARGB(255, 46, 46, 46), // Color del botón
                      ),
                      child: const Text(
                        'Registrarse',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
