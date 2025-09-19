import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});
  static const String name = "/edit-task";
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDescriptionController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF84C000),
          ),
        ),
        title: Text("Edit Task"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Task Title", style: TextTheme.of(context).titleMedium),
        
                const SizedBox(height: 6),
        
                TextFormField(
                  controller: _taskNameController,
                  expands: false,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    hintText: "e.g. Design Landing Page Header",
                    hintStyle: TextTheme.of(context).titleMedium,
                    fillColor: Color(0xFFF7FFEF),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
        
                const SizedBox(height: 24),
        
                Text(
                  "Task Description",
                  style: TextTheme.of(context).titleMedium,
                ),
        
                const SizedBox(height: 6),
        
                TextFormField(
                  controller: _taskDescriptionController,
                  expands: false,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    hintText:
                    "e.g. Include logo, navigation, and CTA button with brand color",
                    hintStyle: TextTheme.of(context).titleMedium,
                    fillColor: Color(0xFFF7FFEF),
                    filled: true,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
        
                const SizedBox(height: 10),
        
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:_onTapUpdateButton,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF84C000),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      "Update Task",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onTapUpdateButton(){}
}

