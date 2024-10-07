
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getProjects() async {
  List projects = [];
  CollectionReference collectionReferenceProjects = db.collection('projects');

  QuerySnapshot queryProject = await collectionReferenceProjects.get();
 queryProject.docs.forEach((documento) { 
  projects.add(documento.data());
 });
 return projects;
}