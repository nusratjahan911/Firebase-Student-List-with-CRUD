import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live_score_app_with_firebase/add_student_screen.dart';
import 'package:live_score_app_with_firebase/update_student_screen.dart';
class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {

  List<StudentsList> _studensList = [];
  bool _inProgress = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _getStudentsList();
  // }
  //
  // Future<void> _getStudentsList() async{
  //   _inProgress = true;
  //   setState(() {});
  //   _studensList.clear();
  //   final snapshots = await FirebaseFirestore.instance.collection('students').get();
  //   for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshots.docs){
  //     _studensList.add(StudentsList(
  //       id: doc.id,
  //       studentName: doc.get('name'),
  //       studentRoll: doc.get('rollNumber'),
  //       studentCourse: doc.get('course'),
  //
  //     )
  //     );
  //   }
  //   _inProgress = false;
  //   setState(() {});
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students List..',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple[200],
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, snapshots) {
         if(snapshots.connectionState == ConnectionState.waiting){
           return Center(child: CircularProgressIndicator());
         }else if(snapshots.hasError){
           return Center(
             child: Text(snapshots.error.toString()),
           );
         }else if(snapshots.hasData){
           _studensList.clear();

           for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshots.data!.docs){
             _studensList.add(StudentsList(
               id: doc.id,
               studentName: doc.get('name'),
               studentRoll: doc.get('rollNumber'),
               studentCourse: doc.get('course'),

             )
             );
           }

           return ListView.builder(
               itemCount: _studensList.length,
               itemBuilder: (context, index){
                 final students = _studensList[index];
                 return ListTile(
                   title: Text('${students.studentName}'),
                   subtitle: Text('Roll: ${students.studentRoll} |  Course: ${students.studentCourse}'),
                   trailing: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       ///Update student
                       IconButton(onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateStudentScreen(
                             id: students.id,
                             name: students.studentName,
                             rollNumber: students.studentRoll,
                             course: students.studentCourse
                         ) ,
                         )
                         );
                       }, icon: Icon(Icons.edit,color: Colors.blue)),

                       ///Delete student from list
                       IconButton(
                         onPressed: () {
                           FirebaseFirestore.instance
                               .collection('students')
                               .doc(students.id)
                               .delete();
                         },
                         icon: Icon(Icons.delete, color: Colors.red),
                       ),
                     ],
                   ),


                 );
               }
           );
         }
         return SizedBox();

        }
      ),

      //add new student
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddStudentScreen()),
          );
          },
        label: Text("Add Student"),
        icon: Icon(Icons.add),
          ),

    );
  }
}


class StudentsList{
  final String id;
  final String studentName;
  final int studentRoll;
  final String studentCourse;


  StudentsList({
    required this.id,
    required this.studentName,
    required this.studentRoll,
    required this.studentCourse,

  });



}
