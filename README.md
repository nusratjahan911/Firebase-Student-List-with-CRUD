# Firebase-Student-List-with-CRUD
A Flutter app demonstrating CRUD operations (Create, Read, Update, Delete) using Firebase Firestore to manage student information.

Each student contains:
- name (String) – Student's full name
- rollNumber (int) – Student roll number
- course (String) – Student course
 # Screenshots
 <img width="320" height="651" alt="aa" src="https://github.com/user-attachments/assets/750f641e-b805-4c84-9802-2264fc35ebe6"/> 
<img width="317" height="633" alt="bb" src="https://github.com/user-attachments/assets/780e9efd-e067-4c54-8c7b-4b18cef0ced1" />
<img width="308" height="629" alt="cc" src="https://github.com/user-attachments/assets/7da7895c-f3fb-4caf-9cd5-7197aa7b4904" />

# CRUD Operations
- Create: FirebaseFirestore.instance.collection('students').add({...})
- Read: Listen using StreamBuilder for real-time updates
- Update: FirebaseFirestore.instance.collection('students').doc(id).update({...})
- Delete: FirebaseFirestore.instance.collection('students').doc(id).delete()
