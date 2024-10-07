import 'package:flutter/material.dart';
import 'package:volunred_app/modules/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart'; // Importar Firebase
import 'firebase_options.dart'; // Importar configuración de Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegura que los widgets estén inicializados
  await Firebase.initializeApp( // Inicializa Firebase
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
