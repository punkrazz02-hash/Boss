import 'package:flutter/material.dart';
import '../../../../config/app_constants.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Transactions',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(AppConstants.lightGray),
          ),
        ),
        SizedBox(height: AppConstants.md),
        _TransactionItem(
          title: 'Grocery Shopping',
          category: 'Food & Dining',
          amount: '- ₹ 850',
          icon: Icons.shopping_cart,
          color: Color(AppConstants.rubyRed),
        ),
        SizedBox(height: AppConstants.md),
        _TransactionItem(
          title: 'Salary Deposit',
          category: 'Income',
          amount: '+ ₹ 45,000',
          icon: Icons.account_balance_wallet,
          color: Color(AppConstants.emeraldGreen),
        ),
        SizedBox(height: AppConstants.md),
        _TransactionItem(
          title: 'Investment Fund',
          category: 'Investing',
          amount: '- ₹ 5,000',
          icon: Icons.trending_up,
          color: Color(AppConstants.luxuryGold),
        ),
      ],
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String title;
  final String category;
  final String amount;
  final IconData icon;
  final Color color;

  const _TransactionItem({
    required this.title,
    required this.category,
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
        color: Color(AppConstants.mediumGray),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.2),
            ),
            child: Center(
              child: Icon(icon, color: color, size: 20),
            ),
          ),
          SizedBox(width: AppConstants.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: AppConstants.bodySize,
                    fontWeight: FontWeight.w500,
                    color: Color(AppConstants.lightGray),
                  ),
                ),
                Text(
                  category,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: AppConstants.smallSize,
                    fontWeight: FontWeight.w400,
                    color: Color(AppConstants.mediumGray),
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: AppConstants.bodySize,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
