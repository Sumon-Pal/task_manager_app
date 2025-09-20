import 'package:flutter/material.dart';
import 'package:task_manager/ui/asset_path.dart';
import 'package:task_manager/ui/screens/account_setting_screen.dart';
import 'package:task_manager/ui/screens/edit_profile_screen.dart';
import 'package:task_manager/ui/screens/help_and_support_screen.dart';
import 'package:task_manager/ui/screens/my_profile_screen.dart';
import 'package:task_manager/ui/screens/privacy_policy_screen.dart';
import 'package:task_manager/ui/screens/tearms_and_condition_page.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFF7FFEF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Stack(
              //   clipBehavior: Clip.none,
              //   children: [
              //
              //     Image.asset(
              //       AssetPath.profileTopBackground,
              //       fit: BoxFit.cover,
              //       width: double.infinity,
              //       height: 180,
              //     ),
              //
              //
              //     // Positioned(
              //     //   bottom: -40,
              //     //   left: MediaQuery.of(context).size.width / 2 - 50,
              //     //   child: CircleAvatar(
              //     //     radius: 50,
              //     //     backgroundColor: Colors.white,
              //     //     child: ClipOval(
              //     //       child: Image.asset(
              //     //         AssetPath.profileMan,
              //     //         fit: BoxFit.cover,
              //     //         width: 95,
              //     //         height: 95,
              //     //       ),
              //     //     ),
              //     //   ),
              //     // ),
              //   ],
              // ),
              //const SizedBox(height: 60),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipPath(
                    clipper: TopCurveClipper(),
                    child: Container(
                      height: 200,
                      color: const Color(0xFF84C000), // green color
                    ),
                  ),

                  /// Profile Image
                  Positioned(
                    bottom: -50,
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          AssetPath.profileMan, // profile image
                          fit: BoxFit.cover,
                          width: 95,
                          height: 95,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 72),

              _buildMenuItem(
                Icons.person_outline,
                "My Profile",
                _onTapMyProfile,
              ),
              _buildMenuItem(
                Icons.settings_outlined,
                "Account Setting",
                _onTapAccountSetting,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "More",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              _buildMenuItem(
                Icons.description_outlined,
                "Terms & Condition",
                _onTapTermsAndCondition,
              ),
              _buildMenuItem(
                Icons.privacy_tip_outlined,
                "Privacy policy",
                _onTapPrivacyPolicy,
              ),
              _buildMenuItem(
                Icons.help_outline,
                "Help/Support",
                _onTapHelpOrSupport,
              ),
              _buildMenuItem(Icons.logout, "Log Out", _onTapLogOut),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF84C000)),
        title: Text(title),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }

  void _onTapMyProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyProfileScreen()),
    );
  }

  void _onTapAccountSetting() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountSettingScreen()),
    );
  }

  void _onTapTermsAndCondition() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
    );
  }

  void _onTapPrivacyPolicy() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
    );
  }

  void _onTapHelpOrSupport() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SupportPage()),
    );
  }

  void _onTapLogOut() {}
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);

    // curve
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
