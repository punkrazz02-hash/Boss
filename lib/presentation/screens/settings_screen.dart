import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _biometricEnabled = false;
  bool _notificationsEnabled = true;
  String _selectedCurrency = 'INR';
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppConstants.primaryBlack),
      appBar: AppBar(
        backgroundColor: Color(AppConstants.primaryBlack),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(AppConstants.luxuryGold),
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(AppConstants.lightGray),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppConstants.md),
        child: Column(
          children: [
            // Account Section
            _buildSectionTitle('Account'),
            _buildSettingsTile(
              icon: Icons.person,
              title: 'Profile',
              subtitle: 'Edit your profile information',
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.lock,
              title: 'Change Password',
              subtitle: 'Update your password',
              onTap: () {},
            ),
            SizedBox(height: AppConstants.lg),
            // Security Section
            _buildSectionTitle('Security'),
            _buildSettingsToggle(
              icon: Icons.fingerprint,
              title: 'Biometric Authentication',
              subtitle: 'Use fingerprint to unlock',
              value: _biometricEnabled,
              onChanged: (value) {
                setState(() => _biometricEnabled = value);
              },
            ),
            _buildSettingsTile(
              icon: Icons.security,
              title: 'Two-Factor Authentication',
              subtitle: 'Enable for extra security',
              onTap: () {},
            ),
            SizedBox(height: AppConstants.lg),
            // Preferences Section
            _buildSectionTitle('Preferences'),
            _buildSettingsDropdown(
              icon: Icons.language,
              title: 'Language',
              value: _selectedLanguage,
              items: ['English', 'Hindi', 'Spanish'],
              onChanged: (value) {
                setState(() => _selectedLanguage = value ?? 'English');
              },
            ),
            _buildSettingsDropdown(
              icon: Icons.currency_rupee,
              title: 'Currency',
              value: _selectedCurrency,
              items: ['INR', 'USD', 'EUR'],
              onChanged: (value) {
                setState(() => _selectedCurrency = value ?? 'INR');
              },
            ),
            SizedBox(height: AppConstants.lg),
            // Notifications Section
            _buildSectionTitle('Notifications'),
            _buildSettingsToggle(
              icon: Icons.notifications,
              title: 'Notifications',
              subtitle: 'Enable app notifications',
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() => _notificationsEnabled = value);
              },
            ),
            SizedBox(height: AppConstants.lg),
            // About Section
            _buildSectionTitle('About'),
            _buildSettingsTile(
              icon: Icons.info,
              title: 'About BlackVault',
              subtitle: 'Version 1.0.0',
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.description,
              title: 'Terms & Conditions',
              subtitle: 'Read our terms',
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              subtitle: 'Read our privacy policy',
              onTap: () {},
            ),
            SizedBox(height: AppConstants.xl),
            // Sign Out Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => _showSignOutDialog(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(AppConstants.rubyRed),
                ),
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppConstants.md),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(AppConstants.luxuryGold),
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusMd),
        color: Color(AppConstants.mediumGray),
      ),
      child: ListTile(
        leading: Icon(icon, color: Color(AppConstants.luxuryGold)),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: AppConstants.bodySize,
            fontWeight: FontWeight.w600,
            color: Color(AppConstants.lightGray),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: AppConstants.smallSize,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.mediumGray),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Color(AppConstants.luxuryGold),
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSettingsToggle({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusMd),
        color: Color(AppConstants.mediumGray),
      ),
      child: ListTile(
        leading: Icon(icon, color: Color(AppConstants.luxuryGold)),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: AppConstants.bodySize,
            fontWeight: FontWeight.w600,
            color: Color(AppConstants.lightGray),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: AppConstants.smallSize,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.mediumGray),
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Color(AppConstants.luxuryGold),
        ),
      ),
    );
  }

  Widget _buildSettingsDropdown({
    required IconData icon,
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusMd),
        color: Color(AppConstants.mediumGray),
      ),
      child: ListTile(
        leading: Icon(icon, color: Color(AppConstants.luxuryGold)),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: AppConstants.bodySize,
            fontWeight: FontWeight.w600,
            color: Color(AppConstants.lightGray),
          ),
        ),
        trailing: DropdownButton<String>(
          value: value,
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
          onChanged: onChanged,
          underline: SizedBox(),
          dropdownColor: Color(AppConstants.mediumGray),
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(AppConstants.luxuryGold),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(AppConstants.mediumGray),
        title: Text(
          'Sign Out',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Color(AppConstants.lightGray),
          ),
        ),
        content: Text(
          'Are you sure you want to sign out?',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Color(AppConstants.lightGray),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(AppConstants.luxuryGold),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/login');
            },
            child: Text(
              'Sign Out',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(AppConstants.rubyRed),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
