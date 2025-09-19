import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/ui/screens/edit_task_screen.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/screens/main_nav_holder_screen.dart';
import 'package:task_manager/ui/screens/my_task_screen.dart';
import 'package:task_manager/ui/screens/on_boarding_screen.dart';
import 'package:task_manager/ui/screens/set_new_password_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  static GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: "/",
      routes: {
        SplashScreen.name: (context) => SplashScreen(),
        OnBoardingScreen.name: (context) => OnBoardingScreen(),
        LoginScreen.name : (context)=> LoginScreen(),
        SignUpScreen.name : (context)=> SignUpScreen(),
       // VerifyEmailPage.name : (context)=> VerifyEmailPage(email: )
        PasswordSetupScreen.name : (context) => PasswordSetupScreen(),
        MyTaskScreen.name : (context)=> MyTaskScreen(),
        MainNavBarHolderScreen.name : (context)=> MainNavBarHolderScreen(),
        EditTaskScreen.name : (context)=> EditTaskScreen(),
      },
    );
  }
}
