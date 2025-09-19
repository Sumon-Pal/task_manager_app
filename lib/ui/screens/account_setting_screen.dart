import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/change_password_screen.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
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
        title: Text("Account Setting"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              padding: EdgeInsets.fromLTRB(6, 6, 4, 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.lock, color: Color(0xFF84C000)),
                title: Text(
                  "Change Password",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: Color(0xFFF7FFEF),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));
                },
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              padding: EdgeInsets.fromLTRB(6, 6, 4, 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.red),
                title: Text(
                  "Delete Account",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: Colors.red,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
