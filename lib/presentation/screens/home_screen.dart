import 'package:flutter/material.dart';
import '../../config/app_constants.dart';
import '../widgets/dashboard/dashboard_widget.dart';
import '../widgets/calculator/floating_calculator.dart';
import '../widgets/music_player/music_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showCalculator = false;
  bool _showMusicPlayer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppConstants.primaryBlack),
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          // Music Background
          MusicBackground(
            onMusicTap: () {
              setState(() => _showMusicPlayer = !_showMusicPlayer);
            },
          ),
          // Dashboard Content
          DashboardWidget(
            onCalculatorTap: () {
              setState(() => _showCalculator = !_showCalculator);
            },
          ),
          // Floating Calculator
          if (_showCalculator)
            FloatingCalculator(
              onClose: () {
                setState(() => _showCalculator = false);
              },
            ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(AppConstants.luxuryGold),
                  Color(AppConstants.accentGold),
                ],
              ),
            ),
            child: Center(
              child: Text(
                'BV',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: Color(AppConstants.primaryBlack),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(width: AppConstants.md),
          Text(
            'BlackVault',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(AppConstants.luxuryGold),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_none,
            color: Color(AppConstants.luxuryGold),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.person_outline,
            color: Color(AppConstants.luxuryGold),
          ),
          onPressed: () {},
        ),
        SizedBox(width: AppConstants.md),
      ],
    );
  }
}
