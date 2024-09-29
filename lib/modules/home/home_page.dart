import 'package:flutter/material.dart';
import 'package:volunred_app/modules/projects_details/projects_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedFilter = 'Activos'; // Estado inicial del filtro

  // Datos de ejemplo de los proyectos
  final List<Map<String, dynamic>> projectData = [
    {
      'title': 'Proyecto 1',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 1.',
      'volunteer': 'Voluntariado 1',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 1.',
      'status': 'Activos',
    },
    {
      'title': 'Proyecto 2',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 2.',
      'volunteer': 'Voluntariado 2',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 2.',
      'status': 'Futuros',
    },
    {
      'title': 'Proyecto 3',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 3.',
      'volunteer': 'Voluntariado 3',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 3.',
      'status': 'Pasados',
    },
    // Proyectos activos
    {
      'title': 'Proyecto 4',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 4.',
      'volunteer': 'Voluntariado 4',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 4.',
      'status': 'Activos',
    },
    {
      'title': 'Proyecto 5',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 5.',
      'volunteer': 'Voluntariado 5',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 5.',
      'status': 'Activos',
    },
    {
      'title': 'Proyecto 6',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 6.',
      'volunteer': 'Voluntariado 6',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 6.',
      'status': 'Activos',
    },
    {
      'title': 'Proyecto 7',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 7.',
      'volunteer': 'Voluntariado 7',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 7.',
      'status': 'Activos',
    },
    // Proyectos futuros
    {
      'title': 'Proyecto 8',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 8.',
      'volunteer': 'Voluntariado 8',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 8.',
      'status': 'Futuros',
    },
    {
      'title': 'Proyecto 9',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 9.',
      'volunteer': 'Voluntariado 9',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 9.',
      'status': 'Futuros',
    },
    {
      'title': 'Proyecto 10',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 10.',
      'volunteer': 'Voluntariado 10',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 10.',
      'status': 'Futuros',
    },
    {
      'title': 'Proyecto 11',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 11.',
      'volunteer': 'Voluntariado 11',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 11.',
      'status': 'Futuros',
    },
    // Proyectos pasados
    {
      'title': 'Proyecto 12',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 12.',
      'volunteer': 'Voluntariado 12',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 12.',
      'status': 'Pasados',
    },
    {
      'title': 'Proyecto 13',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 13.',
      'volunteer': 'Voluntariado 13',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 13.',
      'status': 'Pasados',
    },
    {
      'title': 'Proyecto 14',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 14.',
      'volunteer': 'Voluntariado 14',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 14.',
      'status': 'Pasados',
    },
    {
      'title': 'Proyecto 15',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 15.',
      'volunteer': 'Voluntariado 15',
      'detailedDescription': 'Esta es una descripción extensa del Proyecto 15.',
      'status': 'Pasados',
    },
  ];

  final List<Map<String, dynamic>> volunteerButtons = [
    {'name': 'Voluntariado 1', 'color': Colors.red},
    {'name': 'Voluntariado 2', 'color': Colors.blue},
    {'name': 'Voluntariado 3', 'color': Colors.green},
    {'name': 'Voluntariado 4', 'color': Colors.orange},
    {'name': 'Voluntariado 5', 'color': Colors.purple},
    {'name': 'Voluntariado 6', 'color': Colors.cyan},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'VolunRed',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Voluntariados Disponibles'),
              _buildVolunteerButtons(),
              const SizedBox(height: 16),
              Divider(thickness: 2, color: Colors.grey[300]),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle('Proyectos'),
                  _buildFilterDropdown(), // Selector de filtro
                ],
              ),
              
              _buildProjectList(context),
            ],
          ),
        ),
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

  Widget _buildVolunteerButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: volunteerButtons.map((button) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                // Navega a la página de detalles del voluntariado o realiza otra acción
                print('${button['name']} presionado');
              },
              child: Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  color: button['color'] as Color,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  button['name'],
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return DropdownButton<String>(
      value: _selectedFilter,
      items: ['Activos', 'Futuros', 'Pasados'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedFilter = newValue!;
        });
      },
    );
  }
Widget _buildProjectList(BuildContext context) {
  List<Map<String, dynamic>> filteredProjects = projectData
      .where((project) => project['status'] == _selectedFilter)
      .toList();

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
              // Imagen del proyecto
              Image.network(
                project['imageUrl'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              // Contenido sobre la imagen con degradado
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.8), // Degradado negro
                        Colors.transparent, // Fondo transparente
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(8.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        project['description'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Voluntariado: ${project['volunteer']}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
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