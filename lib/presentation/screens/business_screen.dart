import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_constants.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
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
          'Business Management',
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
            // Business Summary
            _buildBusinessCard(
              title: 'Monthly Revenue',
              amount: '₹1,25,000',
              icon: Icons.trending_up,
              color: Color(AppConstants.emeraldGreen),
            ),
            SizedBox(height: AppConstants.lg),
            _buildBusinessCard(
              title: 'Total Expenses',
              amount: '₳45,000',
              icon: Icons.trending_down,
              color: Color(AppConstants.rubyRed),
            ),
            SizedBox(height: AppConstants.lg),
            _buildBusinessCard(
              title: 'Net Profit',
              amount: '₹80,000',
              icon: Icons.attach_money,
              color: Color(AppConstants.luxuryGold),
            ),
            SizedBox(height: AppConstants.xl),
            // Business Sections
            _buildSectionButton('Customers', Icons.people),
            SizedBox(height: AppConstants.md),
            _buildSectionButton('Invoices', Icons.receipt),
            SizedBox(height: AppConstants.md),
            _buildSectionButton('Inventory', Icons.inventory_2),
            SizedBox(height: AppConstants.md),
            _buildSectionButton('Analytics', Icons.analytics),
          ],
        ),
      ),
    );
  }

  Widget _buildBusinessCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(AppConstants.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusLg),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
              SizedBox(height: AppConstants.md),
              Text(
                amount,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ],
          ),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.2),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionButton(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.all(AppConstants.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusMd),
        border: Border.all(
          color: Color(AppConstants.luxuryGold).withOpacity(0.3),
          width: 1,
        ),
        color: Color(AppConstants.mediumGray),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(AppConstants.luxuryGold), size: 24),
          SizedBox(width: AppConstants.md),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: AppConstants.bodySize,
                fontWeight: FontWeight.w600,
                color: Color(AppConstants.lightGray),
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Color(AppConstants.luxuryGold),
            size: 16,
          ),
        ],
      ),
    );
  }
}
