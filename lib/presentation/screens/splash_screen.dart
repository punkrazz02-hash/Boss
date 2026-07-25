import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _navigateNext();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: AppConstants.slowAnimationDuration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  void _navigateNext() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/onboarding');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppConstants.primaryBlack),
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(AppConstants.luxuryGold),
                        Color(AppConstants.accentGold),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(AppConstants.luxuryGold).withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'BV',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: Color(AppConstants.primaryBlack),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppConstants.xl),
                Text(
                  AppConstants.appName,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: AppConstants.titleSize,
                    fontWeight: FontWeight.w700,
                    color: Color(AppConstants.luxuryGold),
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: AppConstants.sm),
                Text(
                  AppConstants.appMission,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: AppConstants.bodySize,
                    fontWeight: FontWeight.w300,
                    color: Color(AppConstants.mediumGray),
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
