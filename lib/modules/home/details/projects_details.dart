import 'package:flutter/material.dart';
import 'package:volunred_app/models/project.dart';
import 'package:volunred_app/models/registration.dart';
import 'package:volunred_app/modules/home/details/register_projects.dart';
import 'package:volunred_app/services/firebase_service.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  ProjectDetailPage({required this.project});

  @override
  Widget build(BuildContext context) {
    bool showRegisterButton =
        project.status == 'Activos' || project.status == 'Futuros';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Informacion del proyecto',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen con bordes redondeados
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  project.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
              SizedBox(height: 16),

              // Título del proyecto
              Text(
                project.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Descripción dentro de un Card estilizado
              Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    project.description,
                    style: TextStyle(fontSize: 16, height: 1.4),
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Lista de inscritos mejorada
              _buildRegisteredVolunteersList(),

              // Botón de registro con estilo
              SizedBox(
                height: 20,
              ),
              if (showRegisterButton)
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF3D4052), // Primer color del degradado
                          Color(0xFF09090C), // Segundo color del degradado
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterProjectPage(
                              project: project,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors
                            .transparent, // Color de fondo transparente para ver el degradado
                        shadowColor: Colors
                            .transparent, // Para que la sombra no bloquee el degradado
                      ),
                      child: const Text(
                        'Inscribirse',
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

  // Lista de inscritos mejorada con avatars e íconos
  // Lista de inscritos mejorada con avatars e íconos
  Widget _buildRegisteredVolunteersList() {
    return FutureBuilder<List<Registration>>(
      future: DataService().getRegistrationData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Text('Error al cargar inscritos');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No hay inscritos todavía');
        } else {
          final registeredVolunteers = snapshot.data!
              .where((registration) =>
                  registration.projectId.id.toString() == '${project.id}')
              .toList();

          if (registeredVolunteers.isEmpty) {
            return Center(
                child: const Text('No hay inscritos para este proyecto.'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Inscritos al Proyecto:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: registeredVolunteers.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final registration = registeredVolunteers[index];
                  return Card(
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(registration.name ?? 'Nombre no disponible'),
                      subtitle:
                          Text(registration.title ?? 'Título no disponible'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),
            ],
          );
        }
      },
    );
  }
}
