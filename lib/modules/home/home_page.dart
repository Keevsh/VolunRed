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
    'title': 'Construcción de Viviendas Ecológicas',
    'imageUrl':
        'https://inarquia.es/wp-content/uploads/2133-construir-casa-ecologica-PR.png',
    'description':
        'Construcción de casas sustentables para familias de bajos recursos.',
    'volunteer': 'Manos Unidas',
    'detailedDescription':
        'En este proyecto, los voluntarios ayudarán en la construcción de viviendas utilizando materiales reciclados y técnicas de arquitectura sostenible. A través de este esfuerzo, buscamos no solo proporcionar hogares dignos a familias en situación vulnerable, sino también generar conciencia sobre la importancia de la sostenibilidad y el uso de recursos renovables en la construcción. Los voluntarios estarán involucrados en todas las etapas del proceso, desde la planificación y diseño hasta la construcción y finalización de las casas, garantizando que cada vivienda se adapte a las necesidades específicas de cada familia.',
    'status': 'Activos',
  },
  {
    'title': 'Reforestación en el Amazonas',
    'imageUrl':
        'https://solagro.com.pe/wp-content/uploads/2019/01/REFORESTACI%C3%93N-1024x509.jpg',
    'description':
        'Proyecto de reforestación para combatir la deforestación en la región amazónica.',
    'volunteer': 'Guardianes del Bosque',
    'detailedDescription':
        'Voluntarios se unirán para plantar árboles y restaurar zonas afectadas por la deforestación en el Amazonas. Este proyecto no solo busca reforestar el área, sino también involucrar a las comunidades locales en la conservación de su entorno natural. Los participantes aprenderán sobre la flora y fauna nativas, así como sobre prácticas de conservación efectivas, y participarán en talleres educativos para crear conciencia sobre la importancia de preservar nuestros ecosistemas. La colaboración con los líderes comunitarios garantizará que las iniciativas sean sostenibles a largo plazo.',
    'status': 'Futuros',
  },
  {
    'title': 'Educación para Todos',
    'imageUrl':
        'https://iisec.ucb.edu.bo/assets_iisec/img/publicacion/600x315/Educacion_en_Bolivia_thumb.jpg',
    'description':
        'Programa de tutorías y apoyo escolar para niños de bajos recursos.',
    'volunteer': 'Red de Voluntarios Educativos',
    'detailedDescription':
        'El objetivo de este proyecto es proporcionar clases de apoyo a estudiantes en situación de vulnerabilidad para mejorar su rendimiento académico y brindar oportunidades educativas de calidad. Los voluntarios serán capacitados para ofrecer tutorías personalizadas en diversas materias, además de organizar talleres y actividades extracurriculares que fomenten el aprendizaje integral. Se busca no solo mejorar las calificaciones, sino también inspirar a los jóvenes a perseguir sus sueños y desarrollar habilidades que les serán útiles a lo largo de su vida. Además, se trabajará en la creación de un ambiente de aprendizaje positivo y motivador.',
    'status': 'Activos',
  },
  {
    'title': 'Banco de Alimentos Comunitario',
    'imageUrl':
        'https://www.gob.mx/cms/uploads/article/main_image/1880/110315_miguel_angel_mancera-banco_de_alimentos_ceda_5.jpg',
    'description':
        'Recopilación y distribución de alimentos a familias en situación de pobreza.',
    'volunteer': 'Solidaridad en Acción',
    'detailedDescription':
        'Este proyecto tiene como objetivo distribuir alimentos no perecederos a familias de bajos ingresos. Los voluntarios participarán en la recolección, clasificación y entrega de alimentos en diferentes comunidades, trabajando en estrecha colaboración con organizaciones locales para identificar las necesidades de las familias y asegurar que los alimentos lleguen a quienes más los necesitan. Además, se llevarán a cabo campañas de sensibilización para informar sobre la importancia de combatir el hambre y la desnutrición, involucrando a la comunidad en la lucha contra estos problemas sociales.',
    'status': 'Activos',
  },
  {
    'title': 'Protección de Tortugas Marinas',
    'imageUrl':
        'https://traveler.marriott.com/es/wp-content/uploads/sites/2/2018/06/GI-148404563-UnderwaterSeaTurtle-header.jpg',
    'description':
        'Proyecto de conservación para proteger las tortugas marinas en peligro de extinción.',
    'volunteer': 'EcoGuardianes',
    'detailedDescription':
        'Voluntarios ayudarán en la protección y monitoreo de tortugas marinas en su hábitat natural, asegurándose de que lleguen al océano de manera segura. Este proyecto incluye la realización de actividades de limpieza de playas, educación ambiental y el seguimiento de las poblaciones de tortugas. Los voluntarios recibirán formación sobre el ciclo de vida de las tortugas y las amenazas que enfrentan, y participarán en actividades de concienciación dirigidas a turistas y locales para fomentar la protección de estas especies en peligro de extinción.',
    'status': 'Futuros',
  },
  {
    'title': 'Asistencia Médica en Zonas Rurales',
    'imageUrl':
        'https://www.minsalud.gob.bo/images/noticias16/misaludnota2.gif',
    'description':
        'Brindar atención médica y sanitaria a comunidades rurales.',
    'volunteer': 'Salud para Todos',
    'detailedDescription':
        'Este proyecto busca llevar servicios médicos básicos a comunidades rurales alejadas, que tienen acceso limitado a centros de salud. Los voluntarios, que pueden ser médicos, enfermeras o personas con conocimientos de primeros auxilios, brindarán atención médica, servicios de vacunación y educación en salud. A través de jornadas de salud, se abordarán temas cruciales como la prevención de enfermedades y la importancia de una buena nutrición, mientras se establecen relaciones de confianza con las comunidades para fomentar el autocuidado y la salud preventiva.',
    'status': 'Pasados',
  },
  {
    'title': 'Construcción de Pozos de Agua en Comunidades Rurales',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuA9PRlnIgSqmaR6xfv9Sd_Kd7AJBhzdiAWA&s',
    'description':
        'Proyecto de acceso a agua potable mediante la construcción de pozos.',
    'volunteer': 'Agua para la Vida',
    'detailedDescription':
        'Voluntarios colaborarán en la construcción de pozos para proveer agua potable a comunidades rurales que no tienen acceso a fuentes de agua limpia. Este proyecto no solo se centrará en la construcción física de los pozos, sino también en la educación sobre la importancia del agua potable y la higiene. Se brindará capacitación a los voluntarios sobre técnicas de construcción sostenible y se trabajará junto con los miembros de la comunidad para garantizar que el mantenimiento de los pozos se realice de manera adecuada y continua, mejorando así la calidad de vida de los habitantes.',
    'status': 'Pasados',
  },
  {
    'title': 'Rescate de Animales Abandonados',
    'imageUrl':
        'https://imagenes.eltiempo.com/files/image_1200_600/uploads/2022/03/08/6227fed4ba887.jpeg',
    'description':
        'Proyecto de rescate y adopción de animales abandonados en zonas urbanas.',
    'volunteer': 'Hogar Animal',
    'detailedDescription':
        'Este proyecto tiene como fin el rescate de perros y gatos abandonados. Los voluntarios ayudarán en el cuidado, alimentación y rehabilitación de los animales hasta que encuentren un hogar definitivo. Además, se realizarán campañas de adopción y concienciación sobre la tenencia responsable de mascotas, fomentando la adopción en lugar de la compra. Los voluntarios aprenderán sobre el bienestar animal y tendrán la oportunidad de interactuar con los animales, ayudando a mejorar sus condiciones de vida y promoviendo la empatía hacia todos los seres vivos.',
    'status': 'Pasados',
  }
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
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center, // Centrar el contenido
    children: [
      Icon(Icons.volunteer_activism, size: 28), // Cambia el ícono según tus necesidades
      const SizedBox(width: 8), // Espacio entre el ícono y el texto
      const Text(
        'VolunRed',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
      ),
    ],
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
                bottom: 0, // Mantiene el degradado al fondo
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(top: 70, bottom: 8.0), // Ajusta el padding superior
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.9), // Degradado negro
                        Colors.transparent, // Fondo transparente
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
                          project['title'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.1, // Ajusta este valor para reducir el interlineado
                          ),
                          maxLines: 2, // Limita el texto a 2 líneas
                          overflow: TextOverflow.ellipsis, // Maneja el texto largo
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
