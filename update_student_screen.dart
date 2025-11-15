import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateStudentScreen extends StatelessWidget {
  final String id;
  final String name;
  final int rollNumber;
  final String course;

  UpdateStudentScreen({
    required this.id,
    required this.name,
    required this.rollNumber,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameC = TextEditingController(text: name);
    final TextEditingController rollC =
    TextEditingController(text: rollNumber.toString());
    final TextEditingController courseC = TextEditingController(text: course);

    return Scaffold(
      appBar: AppBar(
          title: Text("Update Student"),
        backgroundColor: Colors.purple[200],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              TextField(controller: nameC, decoration: InputDecoration(labelText: "Name")),
              TextField(controller: rollC, decoration: InputDecoration(labelText: "Roll Number")),
              TextField(controller: courseC, decoration: InputDecoration(labelText: "Course")),
              SizedBox(height: 20),
          
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[300],
                    foregroundColor: Colors.black
                ),
                child: Text("Update student"),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('students')
                      .doc(id)
                      .update({
                    'name': nameC.text,
                    'rollNumber': int.parse(rollC.text),
                    'course': courseC.text,
                  });
          
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
