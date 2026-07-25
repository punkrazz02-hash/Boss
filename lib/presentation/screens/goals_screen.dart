import 'package:flutter/material.dart';
import '../../config/app_constants.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppConstants.primaryBlack),
      appBar: AppBar(
        backgroundColor: Color(AppConstants.primaryBlack),
        elevation: 0,
        title: Text(
          'Financial Goals',
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
            // Overall Progress
            Container(
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
                  Text(
                    'Overall Progress',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: AppConstants.smallSize,
                      fontWeight: FontWeight.w400,
                      color: Color(AppConstants.mediumGray),
                    ),
                  ),
                  SizedBox(height: AppConstants.md),
                  Text(
                    '3 of 5 Goals',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(AppConstants.luxuryGold),
                    ),
                  ),
                  SizedBox(height: AppConstants.lg),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.radiusSm),
                    child: LinearProgressIndicator(
                      value: 0.6,
                      minHeight: 8,
                      backgroundColor: Color(AppConstants.mediumGray),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(AppConstants.luxuryGold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppConstants.lg),
            // Goals List
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppConstants.md),
              itemBuilder: (context, index) => _buildGoalCard(index),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(AppConstants.luxuryGold),
        child: Icon(
          Icons.add,
          color: Color(AppConstants.primaryBlack),
        ),
      ),
    );
  }

  Widget _buildGoalCard(int index) {
    final titles = [
      'Emergency Fund',
      'Dream Vacation',
      'Car Purchase',
      'House Down Payment',
      'Business Capital',
    ];
    final amounts = ['₹2,00,000', '₹5,00,000', '₹15,00,000', '₹50,00,000', '₹10,00,000'];
    final progress = [0.75, 0.45, 0.2, 0.15, 0.5];

    return Container(
      padding: EdgeInsets.all(AppConstants.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusMd),
        color: Color(AppConstants.mediumGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titles[index],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: AppConstants.bodySize,
                  fontWeight: FontWeight.w600,
                  color: Color(AppConstants.lightGray),
                ),
              ),
              Text(
                '${(progress[index] * 100).toStringAsFixed(0)}%',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: AppConstants.bodySize,
                  fontWeight: FontWeight.w600,
                  color: Color(AppConstants.luxuryGold),
                ),
              ),
            ],
          ),
          SizedBox(height: AppConstants.sm),
          Text(
            amounts[index],
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: AppConstants.smallSize,
              fontWeight: FontWeight.w400,
              color: Color(AppConstants.mediumGray),
            ),
          ),
          SizedBox(height: AppConstants.md),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.radiusSm),
            child: LinearProgressIndicator(
              value: progress[index],
              minHeight: 6,
              backgroundColor: Color(AppConstants.mediumGray),
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(AppConstants.luxuryGold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
