import 'package:flutter/material.dart';
import 'package:task_manager/ui/asset_path.dart';
import 'package:task_manager/ui/screens/task_details_screens.dart';

class MyTaskScreen extends StatefulWidget {
  const MyTaskScreen({super.key});
static const String name = "/my-task";
  @override
  State<MyTaskScreen> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends State<MyTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --- Profile Row ---
              Row(
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundImage: AssetImage(AssetPath.userImage),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello Mojahid",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Welcome to Task Manager",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),
              const Text(
                "My Tasks",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              const SizedBox(height: 8),

              /// --- Task Cards ---
              Column(
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: _onTapCard,
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetPath.cardBackground),
                          fit: BoxFit.cover, // 👈 ensures full fit
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.note_add,
                              color: Colors.greenAccent,
                              size: 26,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Design Landing Page Header",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Create a clean, responsive header section with logo, navigation links, and a clear call-to-action button."
                              "Create a clean, responsive header section with logo, navigation links, and a clear call-to-action button.",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapCard() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskDetailsScreens()),
    );
  }
}
