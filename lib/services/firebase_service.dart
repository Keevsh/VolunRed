import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:volunred_app/models/project.dart';
import 'package:volunred_app/models/registration.dart';
import 'package:volunred_app/models/volunteer.dart';

class DataService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Volunteer>> getVolunteering() async {
    List<Volunteer> volunteers = [];
    CollectionReference collectionReference = db.collection('volunteers');

    QuerySnapshot querySnapshot = await collectionReference.get();

    for (var document in querySnapshot.docs) {
      var data = document.data();
      if (data is Map<String, dynamic>) {
        volunteers.add(Volunteer(
          name: data['name'] ?? 'Nombre no disponible',
          imageUrl: data['imageUrl'] ??
              'https://images.wondershare.com/repairit/aticle/2021/07/resolve-images-not-showing-problem-1.jpg',
          description: data['description'] ?? 'Descripción no disponible',
          mission: data['mission'] ?? 'Misión no disponible',
          vision: data['vision'] ?? 'Visión no disponible',
          values: data['values'] ?? 'Valores no disponibles',
        ));
      } else {
        print('Error: Data for document ${document.id} is not a valid map.');
      }
    }

    return volunteers;
  }

  Future<List<Project>> getProjects() async {
    List<Project> projects = [];
    CollectionReference collectionReference = db.collection('projects');

    QuerySnapshot querySnapshot = await collectionReference.get();

    for (var document in querySnapshot.docs) {
      var data = document.data();
      if (data is Map<String, dynamic>) {
        projects.add(Project(
          id: document.id,
          title: data['title'] ?? 'Título no disponible',
          imageUrl: data['imageUrl'] ??
              'https://default-image-url.com',
          description: data['description'] ?? 'Descripción no disponible',
          volunteer: data['volunteer'] ?? 'Voluntariado no disponible',
          detailedDescription: data['detailedDescription'] ??
              'Descripción detallada no disponible',
          status: data['status'] ?? 'Estado no disponible',
        ));
      } else {
        print('Error: Data for document ${document.id} is not a valid map.');
      }
    }

    return projects;
  }
 
 
  Future<void> addRegistration(String projectId, String userId) async {
  CollectionReference collectionReference = db.collection('registrations');

  DocumentReference projectRef = db.collection('projects').doc(projectId);
  DocumentReference userRef = db.collection('users').doc(userId);

  Registration registration = Registration(
    projectId: projectRef,
    userId: userRef,
  );

  await collectionReference.add(registration.toMap());
}Future<List<Registration>> getRegistrationData() async {
  List<Registration> registration = []; 
  final registrationsRef = FirebaseFirestore.instance.collection('registrations');
  
  try {
    final registrationsSnapshot = await registrationsRef.get();

    for (var doc in registrationsSnapshot.docs) {
      final userDocRef = doc.get('userId') as DocumentReference; 
      final projectDocRef = doc.get('projectId') as DocumentReference; 
      //final date = doc.get('date');

      final userDocFuture = userDocRef.get(); 
      final projectDocFuture = projectDocRef.get();


      final results = await Future.wait([userDocFuture, projectDocFuture]);

      final userDoc = results[0];
      final projectDoc = results[1];

     
      if (userDoc.exists && projectDoc.exists) {
        final userName = userDoc.get('name');
        final projectTitle = projectDoc.get('title');

        registration.add(Registration(
          projectId: projectDocRef, 
          userId: userDocRef, 
          name: userName, 
          title: projectTitle
        ));
      } else {
        print('Error: Usuario o proyecto no encontrado para el registro ${doc.id}');
      }
    }
  } catch (e) {
    print('Error al obtener datos de registros: $e');
  }

  return registration;
}


}