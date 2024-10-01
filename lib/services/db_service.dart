/* import 'package:mysql1/mysql1.dart';

class DbService {
  late MySqlConnection connection;

  Future<void> connect() async {
    final settings = ConnectionSettings(
      host: 'localhost', 
      port: 3306,      
      user: 'root', 
      password: '12345', 
      db: 'VoluntariadoDB', 
    );

    connection = await MySqlConnection.connect(settings);
  }

  Future<List<Map<String, dynamic>>> getVoluntariados() async {
    final results = await connection.query('SELECT * FROM Voluntariado');
    return results.map((row) => row.fields).toList();
  }

  Future<List<Map<String, dynamic>>> getProyectos() async {
    final results = await connection.query('SELECT * FROM Proyecto');
    return results.map((row) => row.fields).toList();
  }

  Future<void> close() async {
    await connection.close();
  }
}
 */