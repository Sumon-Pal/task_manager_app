import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:task_manager/ui/screens/set_new_password_screen.dart';

// Assume this is part of your existing VerifyOTPScreen widget
class VerifyOTPScreen extends StatefulWidget {
  final String email;

  const VerifyOTPScreen({super.key, required this.email});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  void dispose() {
    _pinPutController.dispose();
    _pinPutFocusNode.dispose();
    super.dispose();
  }

  // Function to handle OTP verification
  void _verifyPin() {
    Navigator.pushReplacementNamed(context, PasswordSetupScreen.name);
    String pin = _pinPutController.text;
    // Your verification logic here
    print("Entered PIN: $pin");
    // For example, if pin == '123456' navigate to LoginScreen()
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  // Function to go back to the previous screen
  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color(0xFFF7FFEF), // Your specified box decoration color
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(
        color: const Color(0xFF84C000), // Example border color, adjust if needed
        width: 2.0,
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '6-digit code',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              'Enter the verification code sent to your email:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.email,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // PIN Code Field using pinput
            Pinput(
              controller: _pinPutController,
              focusNode: _pinPutFocusNode,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Color of the entered text
                ),
                decoration: pinPutDecoration,
              ),
              validator: (value) {
                // You can add validation logic here, e.g., check length
                return value!.length == 6 ? null : 'PIN is incorrect';
              },
              onChanged: (value) {
                // Optional: handle input changes
                print("Current PIN: $value");
              },
              onCompleted: (pin) {
                // Call your verification function when the PIN is complete
                _verifyPin();
              },
              length: 6, // Number of digits expected
              // Android and iOS specific properties can also be customized
            ),

            const SizedBox(height: 32),
            // The Confirm button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _verifyPin, // Call verifyPin when confirm is pressed
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF84C000), // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}