import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _secureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newConfirmPasswordController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF84C000),
          ),
        ),
        title: Text("Change Password"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Type Password", style: TextTheme.of(context).titleMedium),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _oldPasswordController,
                  obscureText: _secureText,
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                      icon: Icon(
                        _secureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                      ),
                    ),

                    fillColor: Color(0xFFF7FFEF),
                    hintText: "••••••••••••••",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                Text("New Password", style: TextTheme.of(context).titleMedium),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: _secureText,
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                      icon: Icon(
                        _secureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                      ),
                    ),

                    fillColor: Color(0xFFF7FFEF),
                    hintText: "••••••••••••••",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                Text(
                  "New Confirm Password",
                  style: TextTheme.of(context).titleMedium,
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _newConfirmPasswordController,
                  obscureText: _secureText,
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                      icon: Icon(
                        _secureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                      ),
                    ),

                    fillColor: Color(0xFFF7FFEF),
                    hintText: "••••••••••••••",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onTapUpdateButton,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF84C000),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      "Update",
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
  void _onTapUpdateButton() {}
}