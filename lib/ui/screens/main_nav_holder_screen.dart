import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_task_screen.dart';
import 'package:task_manager/ui/screens/my_task_screen.dart';
import 'package:task_manager/ui/screens/profile_details_screen.dart';
import 'package:task_manager/ui/screens/task_details_screens.dart';

class MainNavBarHolderScreen extends StatefulWidget {
  static const String name = '/main-nav-bar-holder';

  const MainNavBarHolderScreen({super.key});

  @override
  State<MainNavBarHolderScreen> createState() => _MainNavBarHolderScreenState();
}

class _MainNavBarHolderScreenState extends State<MainNavBarHolderScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    MyTaskScreen(),
    AddTaskScreen(),
    ProfileDetailsScreen(),
    TaskDetailsScreens()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        activeColor: Color(0xFF84C000),
        backgroundColor: Colors.white,
        color: Colors.black,
        initialActiveIndex: _selectedIndex,
        onTap: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        items: [
          TabItem(icon:Icon(Icons.home), title: '',),
          TabItem(icon: Icon(Icons.add), title: "Add Task"),
          TabItem(icon: Icon(Icons.person), title: "Profile")
        ],
      ),
    );
  }
}