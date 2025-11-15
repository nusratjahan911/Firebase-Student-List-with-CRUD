import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddStudentScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add Student"),
        backgroundColor: Colors.purple[200],
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Name"
                  ),
                ),
                TextField(
                  controller: rollController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Roll Number"
                  ),
                ),
                TextField(
                  controller: courseController,
                  decoration: InputDecoration(
                      labelText: "Course"
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[300],
                    foregroundColor: Colors.black
                  ),
                  child: Text("Add Student",style: TextStyle(fontSize: 15),),
                  onPressed: () {
                    FirebaseFirestore.instance.collection('students')
                        .add({
                      'name': nameController.text,
                      'rollNumber': int.parse(rollController.text),
                      'course': courseController.text,
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      )

    );
  }
}
