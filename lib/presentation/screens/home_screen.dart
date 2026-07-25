import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_constants.dart';
import '../widgets/dashboard/dashboard_widget.dart';
import '../widgets/calculator/floating_calculator.dart';
import '../widgets/music_player/music_background.dart';
import '../widgets/music_player/music_selection_bottom_sheet.dart';
import '../widgets/logo/blackvault_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showCalculator = false;
  bool _showMusicPlayer = false;
  String? _selectedMusicTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppConstants.primaryBlack),
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: Stack(
        children: [
          // Background with Logo Watermark
          _buildLogoBackground(),
          // Music Background
          MusicBackground(
            onMusicTap: () => _showMusicSelectionSheet(),
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

  /// Professional Logo Background with Glassmorphism
  Widget _buildLogoBackground() {
    return Positioned(
      top: -50,
      right: -100,
      child: Opacity(
        opacity: 0.08,
        child: Transform.rotate(
          angle: 0.5,
          child: BlackVaultShieldLogo(
            size: 400,
            animated: false,
          ),
        ),
      ),
    );
  }

  /// App Bar with Professional Logo
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
              boxShadow: [
                BoxShadow(
                  color: Color(AppConstants.luxuryGold).withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BlackVault',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(AppConstants.luxuryGold),
                ),
              ),
              Text(
                'Build • Track • Grow',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(AppConstants.mediumGray),
                ),
              ),
            ],
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
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        SizedBox(width: AppConstants.md),
      ],
    );
  }

  /// Navigation Drawer
  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Color(AppConstants.primaryBlack),
      child: Column(
        children: [
          // Drawer Header with Logo
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(AppConstants.mediumGray),
                  Color(AppConstants.primaryBlack),
                ],
              ),
              border: Border(
                bottom: BorderSide(
                  color: Color(AppConstants.luxuryGold),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlackVaultLogo(size: 60, animated: false),
                SizedBox(height: AppConstants.md),
                Text(
                  'Welcome, User',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(AppConstants.lightGray),
                  ),
                ),
                Text(
                  'Secure Today, Grow Tomorrow',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(AppConstants.mediumGray),
                  ),
                ),
              ],
            ),
          ),
          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: AppConstants.md),
              children: [
                _buildDrawerItem(
                  icon: Icons.home_outlined,
                  label: 'Dashboard',
                  onTap: () => Navigator.pop(context),
                ),
                _buildDrawerItem(
                  icon: Icons.swap_horiz,
                  label: 'Transactions',
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/transactions');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.trending_up,
                  label: 'Investments',
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/investments');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.target,
                  label: 'Goals',
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/goals');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.business,
                  label: 'Business',
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/business');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.eco,
                  label: 'Farming',
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/farming');
                  },
                ),
                Divider(
                  color: Color(AppConstants.mediumGray),
                  height: AppConstants.lg,
                ),
                _buildDrawerItem(
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/settings');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.help_outline,
                  label: 'Help & Support',
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: Icons.logout,
                  label: 'Sign Out',
                  onTap: () {},
                  isDestructive: true,
                ),
              ],
            ),
          ),
          // Footer
          Container(
            padding: EdgeInsets.all(AppConstants.md),
            border: Border(
              top: BorderSide(
                color: Color(AppConstants.mediumGray),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BlackVault v1.0.0',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: AppConstants.smallSize,
                    fontWeight: FontWeight.w400,
                    color: Color(AppConstants.mediumGray),
                  ),
                ),
                Text(
                  'Build • Track • Grow',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: AppConstants.smallSize,
                    fontWeight: FontWeight.w500,
                    color: Color(AppConstants.luxuryGold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Drawer Menu Item
  Widget _buildDrawerItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive
            ? Color(AppConstants.rubyRed)
            : Color(AppConstants.luxuryGold),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppConstants.bodySize,
          fontWeight: FontWeight.w500,
          color: isDestructive
              ? Color(AppConstants.rubyRed)
              : Color(AppConstants.lightGray),
        ),
      ),
      onTap: onTap,
      hoverColor: Color(AppConstants.mediumGray).withOpacity(0.5),
    );
  }

  /// Show Music Selection Bottom Sheet
  void _showMusicSelectionSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(AppConstants.primaryBlack),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConstants.radiusLg),
          topRight: Radius.circular(AppConstants.radiusLg),
        ),
      ),
      builder: (context) => MusicSelectionBottomSheet(),
    ).then((value) {
      if (value != null) {
        setState(() => _selectedMusicTitle = value.title);
      }
    });
  }
}
