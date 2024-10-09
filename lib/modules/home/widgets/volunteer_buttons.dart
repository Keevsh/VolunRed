import 'package:flutter/material.dart';
import 'package:volunred_app/models/volunteer.dart'; 
import 'package:volunred_app/modules/home/details/volunteer_detail.dart';

class VolunteerButtons extends StatelessWidget {
  final List<Volunteer> volunteerButtons; 

  const VolunteerButtons({Key? key, required this.volunteerButtons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: volunteerButtons.map((volunteer) { 
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VolunteerDetail(
                      volunteer: volunteer,
                    ),
                  ),
                );
              },
              child: Container(
  width: 150,
  height: 80,
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color(0xFF3D4052), 
        Color(0xFF09090C), 
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.3, 1.0], 
    ),
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8, 
        offset: const Offset(0, 4),
      ),
    ],
  ),
  alignment: Alignment.center,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
    volunteer.name, 
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.1, 
    ),
    textAlign: TextAlign.center,
    ),
  ),

),

            ),
          );
        }).toList(),
      ),
    );
  }
}
