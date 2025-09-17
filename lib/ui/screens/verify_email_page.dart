import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/verify_your_OTP_page.dart';

class VerifyEmailPage extends StatefulWidget {
  final String email;

  const VerifyEmailPage({super.key, required this.email});
 static const String name = "/verify-email";
  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 'Verify Your Email' heading
              const Text(
                'Verify Your Email',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              const Text(
                "We'll send a verification code to this email to confirm your account.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),

              // Email input box
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  filled: true,
                  fillColor: const Color(0xFFF7FFEF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 'Send' button
              ElevatedButton(
                onPressed: () {
                  // Function to handle sending the code and navigation
                  _handleSendButtonPress(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF84C000),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A placeholder function to simulate sending the code and navigating
  void _handleSendButtonPress(BuildContext context) {
    // 1. Get the email from the TextEditingController
    final String email = _emailController.text;

    // 3. Navigate to the OTP verification page, passing the email and code
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VerifyOTPScreen(
          email: email,
        ),
      ),
    );
  }
}

