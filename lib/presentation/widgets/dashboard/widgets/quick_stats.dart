import 'package:flutter/material.dart';
import '../../../../config/app_constants.dart';

class QuickStats extends StatelessWidget {
  const QuickStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: AppConstants.md,
      mainAxisSpacing: AppConstants.md,
      children: [
        _StatCard(
          title: 'Income',
          amount: '₹ 45,000',
          icon: Icons.trending_up,
          color: Color(AppConstants.emeraldGreen),
        ),
        _StatCard(
          title: 'Expenses',
          amount: '₹ 12,500',
          icon: Icons.trending_down,
          color: Color(AppConstants.rubyRed),
        ),
        _StatCard(
          title: 'Savings',
          amount: '₹ 32,500',
          icon: Icons.savings,
          color: Color(AppConstants.luxuryGold),
        ),
        _StatCard(
          title: 'Investments',
          amount: '₹ 1,65,000',
          icon: Icons.trending_up,
          color: Color(AppConstants.accentGold),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusMd),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(AppConstants.mediumGray).withOpacity(0.5),
            Color(AppConstants.mediumGray).withOpacity(0.2),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.2),
            ),
            child: Center(
              child: Icon(icon, color: color, size: 18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: AppConstants.smallSize,
                  fontWeight: FontWeight.w400,
                  color: Color(AppConstants.mediumGray),
                ),
              ),
              SizedBox(height: AppConstants.xs),
              Text(
                amount,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
