import 'package:cloud_firestore/cloud_firestore.dart';

class Registration {
  final DocumentReference projectId; // Referencia del proyecto o voluntariado
  final DocumentReference userId;
  final String name;
  final String title;

  Registration({
    required this.projectId,
    required this.userId,
    this.name = 'hola',
    this.title ='holaa',
  });

  // Método para convertir el objeto a un mapa (para Firestore)
  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId, // Guardar DocumentReference directamente
      'userId': userId,       // Guardar DocumentReference directamente
    };
  }

  // Método estático para crear un objeto Registration desde un mapa (de Firestore)
  static Registration fromMap(Map<String, dynamic> map) {
    return Registration(
      projectId: map['projectId'] as DocumentReference,
      userId: map['userId'] as DocumentReference,
    );
  }
}
