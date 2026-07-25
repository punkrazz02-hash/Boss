import 'package:flutter/material.dart';
import '../../../../config/app_constants.dart';

class NetWorthCard extends StatelessWidget {
  const NetWorthCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.lg),
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
            Color(AppConstants.mediumGray).withOpacity(0.5),
            Color(AppConstants.mediumGray).withOpacity(0.2),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Net Worth',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: AppConstants.bodySize,
                  fontWeight: FontWeight.w500,
                  color: Color(AppConstants.mediumGray),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.md,
                  vertical: AppConstants.sm,
                ),
                decoration: BoxDecoration(
                  color: Color(AppConstants.emeraldGreen).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppConstants.radiusSm),
                  border: Border.all(
                    color: Color(AppConstants.emeraldGreen),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.trending_up,
                      color: Color(AppConstants.emeraldGreen),
                      size: 16,
                    ),
                    SizedBox(width: AppConstants.sm),
                    Text(
                      '+12.5%',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: AppConstants.smallSize,
                        fontWeight: FontWeight.w600,
                        color: Color(AppConstants.emeraldGreen),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppConstants.lg),
          Text(
            '₹ 2,45,000',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Color(AppConstants.luxuryGold),
            ),
          ),
          SizedBox(height: AppConstants.md),
          Text(
            'Total Value of All Your Assets',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: AppConstants.smallSize,
              fontWeight: FontWeight.w400,
              color: Color(AppConstants.mediumGray),
            ),
          ),
        ],
      ),
    );
  }
}
