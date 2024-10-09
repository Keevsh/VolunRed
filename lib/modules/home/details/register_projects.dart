import 'package:flutter/material.dart';
import 'package:volunred_app/models/project.dart';
import 'package:volunred_app/services/firebase_service.dart'; // Asegúrate de importar el modelo
import 'package:volunred_app/models/volunteer.dart'; // Importar el modelo Volunteer

class RegisterProjectPage extends StatefulWidget {
  final Project project;

  const RegisterProjectPage({Key? key, required this.project}) : super(key: key);

  @override
  RegisterProjectPageState createState() => RegisterProjectPageState();
}

class RegisterProjectPageState extends State<RegisterProjectPage> {
  bool _acceptTerms = false;
  bool _showFullTerms = false;
  final DataService dataService = DataService();
  final String userId = 'VKmCIydKtkauAIa90EL7'; // ID del usuario

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Inscripcion', 
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Proyecto: ${widget.project.title}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Términos y condiciones
            _buildTermsAndConditions(),

            // Botón para registrar el proyecto
            ElevatedButton(
              onPressed: _acceptTerms ? () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Registrando proyecto...')),
                );

                try {
                  await dataService.addRegistration(widget.project.id, userId);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Inscripción realizada con éxito!')),
                  );
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error al inscribirse: $e')),
                  );
                }
              } : null,
              style: ElevatedButton.styleFrom(
      
                primary: Color.fromARGB(255, 46, 46, 46),
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Inscribirse',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir la sección de términos y condiciones
  Widget _buildTermsAndConditions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Términos y Condiciones',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Al inscribirse en este proyecto de voluntariado, usted acepta que sus datos serán compartidos con la organización a la que se inscribe.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 10),

        // Expansión de términos y condiciones
        GestureDetector(
          onTap: () {
            setState(() {
              _showFullTerms = !_showFullTerms;
            });
          },
          child: Text(
            _showFullTerms ? 'Leer menos' : 'Leer más',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),

        // Mostrar términos completos
        if (_showFullTerms) ...[
          SizedBox(height: 10),
          Text(
            '1. Los participantes deben ser mayores de edad para inscribirse.\n'
            '2. Los datos proporcionados serán utilizados exclusivamente para fines de contacto y no serán compartidos con terceros fuera de la organización.\n'
            '3. La organización se reserva el derecho de aceptar o rechazar inscripciones.\n'
            '4. Los participantes deberán asistir a la capacitación previa a la actividad.\n'
            '5. La organización no se hace responsable de cualquier incidente durante la actividad.\n',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],

        // Checkbox para aceptar los términos
        Row(
          children: [
            Checkbox(
              value: _acceptTerms,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _acceptTerms = value ?? false;
                });
              },
            ),
            Text('Acepto los términos y condiciones'),
          ],
        ),
      ],
    );
  }
}
