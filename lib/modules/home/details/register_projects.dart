import 'package:flutter/material.dart';

class RegisterProjectPage extends StatefulWidget {
  @override
  _RegisterProjectPageState createState() => _RegisterProjectPageState();
}

class _RegisterProjectPageState extends State<RegisterProjectPage> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos del formulario
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void dispose() {
    // Limpiar los controladores cuando se desecha el widget
    _projectNameController.dispose();
    _descriptionController.dispose();
    _organizationController.dispose();
    _locationController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      appBar: AppBar(
        title: Text('Registrar Proyecto de Voluntariado'),
        backgroundColor: Colors.transparent, // Hacer la barra de app transparente
        elevation: 0, // Quitar la sombra de la barra de app
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Aumentar el padding
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Título en negrita y tamaño grande
              Text(
                'Registrar Nuevo Proyecto',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20), // Espacio entre el título y los campos

              // Nombre del proyecto
              _buildTextField(_projectNameController, 'Nombre del Proyecto'),
              SizedBox(height: 16.0),

              // Descripción del proyecto
              _buildTextField(_descriptionController, 'Descripción del Proyecto', maxLines: 4),
              SizedBox(height: 16.0),

              // Organización
              _buildTextField(_organizationController, 'Nombre de la Organización'),
              SizedBox(height: 16.0),

              // Ubicación
              _buildTextField(_locationController, 'Ubicación del Proyecto'),
              SizedBox(height: 16.0),

              // Fecha de inicio
              _buildTextField(_startDateController, 'Fecha de Inicio (dd/mm/yyyy)'),
              SizedBox(height: 16.0),

              // Fecha de finalización
              _buildTextField(_endDateController, 'Fecha de Finalización (dd/mm/yyyy)'),
              SizedBox(height: 24.0),

              // Botón para registrar el proyecto
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Guardar la información del proyecto o enviarla al servidor
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registrando proyecto...')),
                    );
                    // Aquí puedes agregar la lógica para enviar los datos
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 46, 46, 46), // Color secundario de VolunRed
                  padding: EdgeInsets.symmetric(vertical: 15), // Aumentar el padding del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Esquinas redondeadas
                  ),
                ),
                child: Text(
                  'Registrar Proyecto',
                  style: TextStyle(
                    fontSize: 18, // Tamaño del texto del botón
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir los campos de texto
  Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15), // Padding interno
      ),
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingresa $label';
        }
        return null;
      },
    );
  }
}
