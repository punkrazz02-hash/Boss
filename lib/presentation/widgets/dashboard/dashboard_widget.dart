import 'package:flutter/material.dart';
import '../../../config/app_constants.dart';
import 'widgets/net_worth_card.dart';
import 'widgets/quick_stats.dart';
import 'widgets/recent_transactions.dart';

class DashboardWidget extends StatelessWidget {
  final VoidCallback onCalculatorTap;

  const DashboardWidget({
    Key? key,
    required this.onCalculatorTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: kToolbarHeight + AppConstants.lg,
        left: AppConstants.md,
        right: AppConstants.md,
        bottom: AppConstants.xl,
      ),
      child: Column(
        children: [
          // Net Worth Card
          NetWorthCard(),
          SizedBox(height: AppConstants.lg),
          // Quick Stats
          QuickStats(),
          SizedBox(height: AppConstants.lg),
          // Recent Transactions
          RecentTransactions(),
          SizedBox(height: AppConstants.xl),
          // Calculator Button
          Container(
            padding: EdgeInsets.all(AppConstants.md),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(AppConstants.luxuryGold),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(AppConstants.radiusMd),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onCalculatorTap,
                borderRadius: BorderRadius.circular(AppConstants.radiusMd),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calculate_outlined,
                      color: Color(AppConstants.luxuryGold),
                    ),
                    SizedBox(width: AppConstants.md),
                    Text(
                      'Open Calculator',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(AppConstants.luxuryGold),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
