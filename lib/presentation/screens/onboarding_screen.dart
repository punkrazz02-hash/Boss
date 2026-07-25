import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Build',
      subtitle: 'Create your wealth foundation',
      description: 'Start building your financial empire with BlackVault',
      icon: '💎',
    ),
    OnboardingPage(
      title: 'Track',
      subtitle: 'Monitor every transaction',
      description: 'Know exactly where your money goes',
      icon: '📊',
    ),
    OnboardingPage(
      title: 'Grow',
      subtitle: 'Achieve financial freedom',
      description: 'Invest wisely and watch your wealth grow',
      icon: '🚀',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppConstants.primaryBlack),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return _buildOnboardingPage(pages[index]);
              },
            ),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingPage page) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              page.icon,
              style: TextStyle(fontSize: 80),
            ),
            SizedBox(height: AppConstants.xl),
            Text(
              page.title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: AppConstants.headlineSize,
                fontWeight: FontWeight.w700,
                color: Color(AppConstants.luxuryGold),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppConstants.md),
            Text(
              page.subtitle,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(AppConstants.lightGray),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppConstants.lg),
            Text(
              page.description,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: AppConstants.bodySize,
                fontWeight: FontWeight.w400,
                color: Color(AppConstants.mediumGray),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: EdgeInsets.all(AppConstants.lg),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pages.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: AppConstants.xs),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusSm),
                  color: _currentPage == index
                      ? Color(AppConstants.luxuryGold)
                      : Color(AppConstants.mediumGray),
                ),
              ),
            ),
          ),
          SizedBox(height: AppConstants.lg),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == pages.length - 1) {
                  context.go('/login');
                } else {
                  _pageController.nextPage(
                    duration: AppConstants.animationDuration,
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                _currentPage == pages.length - 1
                    ? 'Get Started'
                    : 'Next',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String subtitle;
  final String description;
  final String icon;

  OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
  });
}
