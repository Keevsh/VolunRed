import 'package:flutter/material.dart';
import 'package:volunred_app/models/project.dart'; // Asegúrate de tener el modelo Project
import 'package:volunred_app/modules/home/details/projects_details.dart';

class ProjectList extends StatelessWidget {
  final List<Project> projectData; // Cambia a tipo Project
  final String filter;

  const ProjectList({Key? key, required this.projectData, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filtrar proyectos según el estado
    List<Project> filteredProjects =
        projectData.where((project) => project.status == filter).toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: filteredProjects.length,
      itemBuilder: (context, index) {
        final project = filteredProjects[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectDetailPage(
                  project: project,
                ),
              ),
            );
          },
          child: Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Stack(
              children: [
                Image.network(
                  project.imageUrl, // Cambia a propiedades del modelo
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 70, bottom: 8.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title, // Cambia a propiedades del modelo
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.1,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Ver más..',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
