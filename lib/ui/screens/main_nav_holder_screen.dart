import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_task_screen.dart';
import 'package:task_manager/ui/screens/my_task_screen.dart';
import 'package:task_manager/ui/screens/profile_details_screen.dart';

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
    ProfileDetailsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(icon:Icon(Icons.home), label: '',),
          NavigationDestination(icon: Icon(Icons.add), label: "Add Task"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}