import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Lista de objetos que tendrán nombre y color
  final List<Map<String, dynamic>> buttonData = [
    {'name': 'Voluntariado 1', 'color': Colors.red},
    {'name': 'Voluntariado 2', 'color': Colors.blue},
    {'name': 'Voluntariado 3', 'color': Colors.green},
    {'name': 'Voluntariado 4', 'color': Colors.orange},
    {'name': 'Voluntariado 5', 'color': Colors.purple},
    {'name': 'Voluntariado 6', 'color': Colors.cyan},
  ];

  // Lista de proyectos con nombre, URL de imagen y descripción
  final List<Map<String, dynamic>> projectData = [
    {
      'title': 'Proyecto 1',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 1.',
      'volunteer': 'Voluntariado 1',
    },
    {
      'title': 'Proyecto 2',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 2.',
      'volunteer': 'Voluntariado 2',
    },
    {
      'title': 'Proyecto 3',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 3.',
      'volunteer': 'Voluntariado 3',
    },
    {
      'title': 'Proyecto 4',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 4.',
      'volunteer': 'Voluntariado 4',
    },
    {
      'title': 'Proyecto 5',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 5.',
      'volunteer': 'Voluntariado 5',
    },
    {
      'title': 'Proyecto 6',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 6.',
      'volunteer': 'Voluntariado 6',
    },
    {
      'title': 'Proyecto 7',
      'imageUrl': 'https://via.placeholder.com/400x200',
      'description': 'Descripción breve del Proyecto 7.',
      'volunteer': 'Voluntariado 1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'VolunRed',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Voluntariados Disponibles',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Scroll horizontal para los contenedores generados dinámicamente
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Scroll horizontal
              child: Row(
                children: buttonData.map((button) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        // Acción al tocar el Container
                        print('${button['name']} presionado');
                      },
                      child: Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: button['color'], // Color del Container
                          borderRadius:
                              BorderRadius.circular(12), // Bordes redondeados
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: Offset(0, 3), // Sombra ligera
                            ),
                          ],
                        ),
                        alignment: Alignment.center, // Centrar el texto
                        child: Text(
                          button['name'],
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width, // Ancho de toda la pantalla
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/detail');
                },
                child: Text('Go to Detail Page'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Proyectos Disponibles',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Lista de proyectos con scroll vertical
            ListView.builder(
              itemCount: projectData.length,
              physics: NeverScrollableScrollPhysics(), // Desactiva el desplazamiento del ListView
              shrinkWrap: true, // Permite que el ListView se adapte al tamaño de su contenido
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          projectData[index]['imageUrl'],
                          fit: BoxFit.cover, // Ajusta la imagen
                          width: double.infinity, // Ancho completo del card
                          height: 200, // Altura fija para las imágenes
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.6), // Fondo semi-transparente
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                projectData[index]['volunteer'],
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                projectData[index]['description'],
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
