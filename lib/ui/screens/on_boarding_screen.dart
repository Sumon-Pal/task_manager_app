import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/asset_path.dart';
import 'package:task_manager/ui/screens/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const String name = "/On-Boarding";
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": AssetPath.slider1,
      "title": "Manage Everything in One Place",
      "subtitle":
      "Create, categorize, and keep track of all your personal and work tasks effortlessly — right from your dashboard.",
    },
    {
      "image": AssetPath.slider2,
      "title": "Focus on What Matters Most",
      "subtitle":
      "Set priorities, add deadlines, and sort tasks by importance so you can tackle what truly moves you forward.",
    },
    {
      "image": AssetPath.slider3,
      "title": "Visualize Progress, Stay on Track",
      "subtitle":
      "Monitor completed tasks, ongoing projects, and upcoming deadlines — all in a clear, visual format.",
    },
  ];

  void _onNext() {
    if (_currentPage == onboardingData.length - 1) {
      // last page -> go to LogInScreen
      Navigator.pushReplacementNamed(context, LoginScreen.name);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }


  void _onSkip() {
    Navigator.pushReplacementNamed(context, LoginScreen.name);
  }

  Widget _buildDot(int index) {
    bool isActive = _currentPage == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 20 : 8, // active is longer
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8), // makes pill shape
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      if (_currentPage > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                  ),
                  TextButton(
                    onPressed: _onSkip,
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Color(0xFF84C000), fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      SvgPicture.asset(
                        data["image"]!,
                        height: 250,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        data["title"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          data["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                    (index) => _buildDot(index),
              ),
            ),
            const SizedBox(height: 250),

            // Next / Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: ElevatedButton(
                onPressed: _onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF84C000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  _currentPage == onboardingData.length - 1
                      ? "Continue"
                      : "Next",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}
