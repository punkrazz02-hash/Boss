import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppConstants.lg),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: AppConstants.headlineSize,
                  fontWeight: FontWeight.w700,
                  color: Color(AppConstants.lightGray),
                ),
              ),
              SizedBox(height: AppConstants.sm),
              Text(
                'Continue your wealth journey',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: AppConstants.bodySize,
                  fontWeight: FontWeight.w400,
                  color: Color(AppConstants.mediumGray),
                ),
              ),
              SizedBox(height: AppConstants.xl * 2),
              // Email Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Color(AppConstants.luxuryGold),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: AppConstants.lg),
              // Password Field
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color(AppConstants.luxuryGold),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color(AppConstants.luxuryGold),
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                ),
                obscureText: _obscurePassword,
              ),
              SizedBox(height: AppConstants.md),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(AppConstants.luxuryGold),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppConstants.xl),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => context.go('/home'),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppConstants.lg),
              Center(
                child: Text(
                  'or continue with',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(AppConstants.mediumGray),
                    fontSize: AppConstants.smallSize,
                  ),
                ),
              ),
              SizedBox(height: AppConstants.lg),
              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton('Google', '🔍'),
                  SizedBox(width: AppConstants.lg),
                  _buildSocialButton('Apple', '🍎'),
                ],
              ),
              SizedBox(height: AppConstants.xl),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(AppConstants.lightGray),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(AppConstants.luxuryGold),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String label, String emoji) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(AppConstants.mediumGray),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppConstants.radiusMd),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(AppConstants.radiusMd),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(emoji, style: TextStyle(fontSize: 20)),
                SizedBox(width: AppConstants.sm),
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(AppConstants.lightGray),
                    fontWeight: FontWeight.w500,
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
