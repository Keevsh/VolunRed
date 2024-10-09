import 'package:flutter/material.dart';
import 'package:volunred_app/models/volunteer.dart';
import 'package:volunred_app/models/project.dart'; // Asegúrate de importar el modelo Project
import 'package:volunred_app/modules/home/widgets/filter_dropdown.dart';
import 'package:volunred_app/modules/home/widgets/project_list.dart';
import 'package:volunred_app/modules/home/widgets/volunteer_buttons.dart';
import 'package:volunred_app/services/firebase_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedFilter = 'Activos';
  final DataService dataService = DataService(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.volunteer_activism, size: 28),
            SizedBox(width: 8),
            Text('VolunRed',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
          ],
        ),
      ),
      body: FutureBuilder<List<Volunteer>>(
        future: dataService.getVolunteering(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); 
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); 
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Voluntariados Disponibles'),
                  (snapshot.hasData && snapshot.data!.isNotEmpty)
                      ? VolunteerButtons(
                          volunteerButtons: snapshot.data!, 
                        )
                      : const Center(
                          child: Text('No hay voluntariados disponibles')), 
                  const SizedBox(height: 16),
                  Divider(thickness: 2, color: Colors.grey[300]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionTitle('Proyectos'),
                      FilterDropdown(
                        selectedFilter: _selectedFilter,
                        onChanged: (newFilter) {
                          setState(() {
                            _selectedFilter = newFilter;
                          });
                        },
                      ), // Dropdown
                    ],
                  ),
                  FutureBuilder<List<Project>>(
                    future: dataService.getProjects(),
                    builder: (context, projectSnapshot) {
                      if (projectSnapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (projectSnapshot.hasError) {
                        return Center(child: Text('Error: ${projectSnapshot.error}'));
                      }

                      return ProjectList(
                        projectData: projectSnapshot.data ?? [], 
                        filter: _selectedFilter,
                      ); 
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
