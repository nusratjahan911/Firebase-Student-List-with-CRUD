
import 'package:flutter/material.dart';
import 'package:live_score_app_with_firebase/student_list_screen.dart';

class FootballLiveScoreApp extends StatefulWidget {
  const FootballLiveScoreApp({super.key});

  @override
  State<FootballLiveScoreApp> createState() => _FootballLiveScoreAppState();
}

class _FootballLiveScoreAppState extends State<FootballLiveScoreApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentListScreen(),
      theme: ThemeData(
        colorSchemeSeed: Colors.purple
      ),

    );
  }
}
