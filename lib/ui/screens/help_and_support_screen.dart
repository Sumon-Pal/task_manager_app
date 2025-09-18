import 'package:flutter/material.dart';

import 'my_task_screen.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  // A map to track the expanded state of each FAQ item
  final Map<int, bool> _isExpanded = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
  };

  final List<String> _faqQuestions = [
    "How do I create a new task?",
    "How can I view task details?",
    "Can I mark a task as favorite or important?",
    "How do I edit or delete a task?",
    "Is my data secure?",
  ];

  final List<String> _faqAnswers = [
    "Tap the “Add Task” button on the navigation bar. Fill in the task title, due date, priority, and other details – then tap “Save”.",
    "Navigate to the 'My Tasks' screen and tap on any task to view its detailed information, including due date, priority, and any notes you've added.",
    "Yes, you can. On the task details screen, you'll find an option to mark the task as a favorite or important, which will highlight it in your task list.",
    "To edit a task, simply tap on it from the 'My Tasks' list and select the edit option. To delete, you can either swipe left on the task or find the delete option in the task's details.",
    "We use industry-standard encryption and security protocols to ensure your data is secure. Your information is stored on a secure cloud server, and we never share it without your permission.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => const MyTaskScreen()),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Help/Support",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Placeholder to balance the row
                  const SizedBox(width: 40),
                ],
              ),
            ),
            const Divider(color: Colors.grey, height: 2, thickness: 1),
            // Main content area
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        "FAQs",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // FAQ section
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _faqQuestions.length,
                        itemBuilder: (context, index) {
                          return _buildFaqItem(index);
                        },
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Need More Help?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Support email section
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.headset_mic_outlined,
                              color: Colors.black,
                              size: 40,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Mail Us: ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "(support@taskmanagerapp.com)",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Our help desk is available 24/7 to support your workflow.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Custom Bottom Navigation Bar
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(int index) {
    final bool isItemExpanded = _isExpanded[index]!;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded[index] = !isItemExpanded;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    _faqQuestions[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  isItemExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.arrow_forward_ios,
                  size: 20,
                ),
              ],
            ),
            if (isItemExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  _faqAnswers[index],
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
