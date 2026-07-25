import 'package:flutter/material.dart';
import '../../../config/app_constants.dart';

/// Premium Logo Widget with Glassmorphism
/// Displays the BlackVault logo with luxury styling
class BlackVaultLogo extends StatefulWidget {
  final double size;
  final bool animated;
  final Duration animationDuration;

  const BlackVaultLogo({
    Key? key,
    this.size = 80,
    this.animated = true,
    this.animationDuration = const Duration(milliseconds: 800),
  }) : super(key: key);

  @override
  State<BlackVaultLogo> createState() => _BlackVaultLogoState();
}

class _BlackVaultLogoState extends State<BlackVaultLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.animated) {
      _animationController = AnimationController(
        duration: widget.animationDuration,
        vsync: this,
      );

      _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
      );

      _rotateAnimation = Tween<double>(begin: -0.1, end: 0.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
      );

      _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
      );

      _animationController.forward();
    }
  }

  @override
  void dispose() {
    if (widget.animated) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animated) {
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.rotate(
              angle: _rotateAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: child,
              ),
            ),
          );
        },
        child: _buildLogo(),
      );
    }

    return _buildLogo();
  }

  Widget _buildLogo() {
    return Container(
      width: widget.size,
      height: widget.size,
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
            color: Color(AppConstants.luxuryGold).withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Color(AppConstants.luxuryGold).withOpacity(0.2),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'BV',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: widget.size * 0.4,
            fontWeight: FontWeight.w700,
            color: Color(AppConstants.primaryBlack),
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

/// Shield Logo - Full BlackVault Shield Design
/// Represents security and trust
class BlackVaultShieldLogo extends StatefulWidget {
  final double size;
  final bool animated;

  const BlackVaultShieldLogo({
    Key? key,
    this.size = 120,
    this.animated = true,
  }) : super(key: key);

  @override
  State<BlackVaultShieldLogo> createState() => _BlackVaultShieldLogoState();
}

class _BlackVaultShieldLogoState extends State<BlackVaultShieldLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.animated) {
      _animationController = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,
      )..repeat(reverse: true);

      _floatAnimation = Tween<double>(begin: 0, end: 10).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
      );
    }
  }

  @override
  void dispose() {
    if (widget.animated) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animated) {
      return AnimatedBuilder(
        animation: _floatAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _floatAnimation.value),
            child: child,
          );
        },
        child: _buildShield(),
      );
    }

    return _buildShield();
  }

  Widget _buildShield() {
    return Container(
      width: widget.size,
      height: widget.size * 1.2,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(widget.size * 0.15),
          bottom: Radius.circular(widget.size * 0.25),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(AppConstants.luxuryGold).withOpacity(0.9),
            Color(AppConstants.accentGold).withOpacity(0.8),
          ],
        ),
        border: Border.all(
          color: Color(AppConstants.luxuryGold),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(AppConstants.luxuryGold).withOpacity(0.5),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_outline,
              color: Color(AppConstants.primaryBlack),
              size: widget.size * 0.4,
            ),
            SizedBox(height: widget.size * 0.1),
            Text(
              'VAULT',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: widget.size * 0.15,
                fontWeight: FontWeight.w700,
                color: Color(AppConstants.primaryBlack),
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Horizontal Logo - BlackVault Text + Icon
class BlackVaultHorizontalLogo extends StatelessWidget {
  final double height;
  final Color? textColor;

  const BlackVaultHorizontalLogo({
    Key? key,
    this.height = 40,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo Circle
        Container(
          width: height,
          height: height,
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
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              'BV',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: height * 0.45,
                fontWeight: FontWeight.w700,
                color: Color(AppConstants.primaryBlack),
              ),
            ),
          ),
        ),
        SizedBox(width: height * 0.4),
        // Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'BlackVault',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: height * 0.5,
                fontWeight: FontWeight.w700,
                color: textColor ?? Color(AppConstants.luxuryGold),
                letterSpacing: 0.5,
              ),
            ),
            Text(
              'Build • Track • Grow',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: height * 0.25,
                fontWeight: FontWeight.w400,
                color:
                    (textColor ?? Color(AppConstants.luxuryGold)).withOpacity(0.7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
