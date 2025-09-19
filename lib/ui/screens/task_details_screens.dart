import 'package:flutter/material.dart';
import 'package:task_manager/ui/asset_path.dart';
import 'package:task_manager/ui/screens/edit_task_screen.dart';
import 'package:task_manager/ui/screens/my_task_screen.dart';

import 'main_nav_holder_screen.dart';

class TaskDetailsScreens extends StatefulWidget {
  const TaskDetailsScreens({super.key});

  @override
  State<TaskDetailsScreens> createState() => _TaskDetailsScreensState();
}

class _TaskDetailsScreensState extends State<TaskDetailsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, MainNavBarHolderScreen.name);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF84C000),
          ),
        ),
        title: Text("Task Details"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // background color
            borderRadius: BorderRadius.circular(4), // rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    // Image.asset(
                    //   AssetPath.taskTitle,
                    //   color: Color(0xFF84C000),
                    //   width: 16,
                    //   height: 16,
                    // ),
                    Icon(Icons.add_chart),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Task Title",
                          style: TextTheme.of(context).titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Design Landing Page Header",
                          style: TextTheme.of(context).titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  color: Color(0xFF84C000), // line color
                  thickness: 1, // line thickness
                  height: 20, // space around the line
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // Image.asset(
                    //   AssetPath.taskDescription,
                    //   color: Color(0xFF84C000),
                    //   width: 16,
                    //   height: 16,
                    // ),
                    Icon(Icons.multiline_chart),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Task Description",
                            style: TextTheme.of(context).titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Create a clean, responsive header section for the landing page. "
                            "Include logo, navigation menu, search bar, and a primary call-to-action button. "
                            "Ensure mobile responsiveness and use the brand green",
                            style: TextTheme.of(context).titleMedium,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  color: Color(0xFF84C000), // line color
                  thickness: 1, // line thickness
                  height: 20, // space around the line
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(color: Colors.red),
                      ),
                      onPressed: _onTapDeleteButton,
                      icon: const Icon(Icons.delete, color: Colors.red),
                      label: const Text(
                        "Delete Task",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(color: Colors.green),
                      ),
                      onPressed: _onTapEditButton,
                      icon: const Icon(Icons.edit, color: Colors.green),
                      label: const Text(
                        "Edit Task",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapBackIcon() {
    Navigator.pop(context);
  }

  void _onTapDeleteButton() {}

  void _onTapEditButton() {
    Navigator.pushNamed(context, EditTaskScreen.name);
  }
}
