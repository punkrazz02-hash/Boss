import 'package:flutter/material.dart';
import '../../../config/app_constants.dart';

class FloatingCalculator extends StatefulWidget {
  final VoidCallback onClose;

  const FloatingCalculator({Key? key, required this.onClose}) : super(key: key);

  @override
  State<FloatingCalculator> createState() => _FloatingCalculatorState();
}

class _FloatingCalculatorState extends State<FloatingCalculator>
    with SingleTickerProviderStateMixin {
  String _display = '0';
  String _previousValue = '';
  String _operation = '';
  bool _shouldResetDisplay = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onNumberPressed(String value) {
    setState(() {
      if (_shouldResetDisplay) {
        _display = value;
        _shouldResetDisplay = false;
      } else {
        if (_display == '0') {
          _display = value;
        } else {
          _display += value;
        }
      }
    });
  }

  void _onOperationPressed(String op) {
    setState(() {
      _previousValue = _display;
      _operation = op;
      _shouldResetDisplay = true;
    });
  }

  void _onEquals() {
    setState(() {
      double num1 = double.parse(_previousValue);
      double num2 = double.parse(_display);
      double result = 0;

      switch (_operation) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '×':
          result = num1 * num2;
          break;
        case '÷':
          result = num1 / num2;
          break;
      }

      _display = result.toString();
      _previousValue = '';
      _operation = '';
      _shouldResetDisplay = true;
    });
  }

  void _onClear() {
    setState(() {
      _display = '0';
      _previousValue = '';
      _operation = '';
      _shouldResetDisplay = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        margin: EdgeInsets.all(AppConstants.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radiusLg),
          border: Border.all(
            color: Color(AppConstants.luxuryGold).withOpacity(0.3),
            width: 1,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(AppConstants.mediumGray).withOpacity(0.8),
              Color(AppConstants.mediumGray).withOpacity(0.5),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(AppConstants.luxuryGold).withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(AppConstants.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Calculator',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(AppConstants.luxuryGold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Color(AppConstants.luxuryGold),
                    ),
                    onPressed: () async {
                      await _animationController.reverse();
                      widget.onClose();
                    },
                  ),
                ],
              ),
            ),
            // Display
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppConstants.md,
                vertical: AppConstants.sm,
              ),
              padding: EdgeInsets.all(AppConstants.md),
              decoration: BoxDecoration(
                color: Color(AppConstants.primaryBlack),
                borderRadius: BorderRadius.circular(AppConstants.radiusMd),
                border: Border.all(
                  color: Color(AppConstants.luxuryGold).withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Text(
                _display,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(AppConstants.luxuryGold),
                ),
                textAlign: TextAlign.right,
              ),
            ),
            // Buttons
            Padding(
              padding: EdgeInsets.all(AppConstants.md),
              child: Column(
                children: [
                  _buildButtonRow(['7', '8', '9', '÷']),
                  SizedBox(height: AppConstants.sm),
                  _buildButtonRow(['4', '5', '6', '×']),
                  SizedBox(height: AppConstants.sm),
                  _buildButtonRow(['1', '2', '3', '-']),
                  SizedBox(height: AppConstants.sm),
                  _buildButtonRow(['0', '.', '=', '+']),
                  SizedBox(height: AppConstants.sm),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: _onClear,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(AppConstants.rubyRed),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusMd),
                        ),
                      ),
                      child: Text(
                        'Clear',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      children: buttons
          .map(
            (btn) => Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.xs),
                child: _buildCalculatorButton(btn),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCalculatorButton(String value) {
    Color bgColor = Color(AppConstants.mediumGray);
    Color textColor = Color(AppConstants.lightGray);

    if (['+', '-', '×', '÷'].contains(value)) {
      bgColor = Color(AppConstants.luxuryGold);
      textColor = Color(AppConstants.primaryBlack);
    } else if (value == '=') {
      bgColor = Color(AppConstants.emeraldGreen);
      textColor = Colors.white;
    }

    return SizedBox(
      height: 44,
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusMd),
        child: InkWell(
          onTap: () {
            if (value == '=') {
              _onEquals();
            } else if (['+', '-', '×', '÷'].contains(value)) {
              _onOperationPressed(value);
            } else {
              _onNumberPressed(value);
            }
          },
          borderRadius: BorderRadius.circular(AppConstants.radiusMd),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
