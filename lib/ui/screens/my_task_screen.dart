import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/privacy_policy_screen.dart';
import 'package:task_manager/ui/screens/tearms_and_condition_page.dart';

import 'help_and_support_screen.dart';

class MyTaskScreen extends StatefulWidget {
  const MyTaskScreen({super.key});

  @override
  State<MyTaskScreen> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends State<MyTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TermsAndConditionsPage()),
              );
            }, child: Text("terms and condition")),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
              );
            }, child: Text("privacy policy")),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SupportPage()),
              );
            }, child: Text("help and support")),
          ],
        ),
      ),
    );
  }
}
