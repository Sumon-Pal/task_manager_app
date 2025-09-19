import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/ui/screens/account_setting_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
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
        title: Text("Add Task"),
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
                  //maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
                    onPressed:_onTapSaveButton,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF84C000),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      "Save Task",
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
  void _onTapSaveButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountSettingScreen()));
  }
}
