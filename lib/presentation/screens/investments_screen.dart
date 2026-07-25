import 'package:flutter/material.dart';
import '../../config/app_constants.dart';

class InvestmentsScreen extends StatefulWidget {
  const InvestmentsScreen({Key? key}) : super(key: key);

  @override
  State<InvestmentsScreen> createState() => _InvestmentsScreenState();
}

class _InvestmentsScreenState extends State<InvestmentsScreen> {
  String _selectedTab = 'All';
  final List<String> _tabs = ['All', 'Stocks', 'Crypto', 'Mutual Funds'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppConstants.primaryBlack),
      appBar: AppBar(
        backgroundColor: Color(AppConstants.primaryBlack),
        elevation: 0,
        title: Text(
          'Investments',
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
            // Portfolio Summary
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
                    'Portfolio Value',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: AppConstants.smallSize,
                      fontWeight: FontWeight.w400,
                      color: Color(AppConstants.mediumGray),
                    ),
                  ),
                  SizedBox(height: AppConstants.md),
                  Text(
                    '₹1,65,000',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Color(AppConstants.luxuryGold),
                    ),
                  ),
                  SizedBox(height: AppConstants.md),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.trending_up,
                          color: Color(AppConstants.emeraldGreen),
                          size: 16,
                        ),
                        SizedBox(width: AppConstants.sm),
                        Text(
                          '+18.3% this year',
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
            ),
            SizedBox(height: AppConstants.lg),
            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _tabs
                    .map(
                      (tab) => Padding(
                        padding: EdgeInsets.only(right: AppConstants.md),
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedTab = tab),
                          child: Column(
                            children: [
                              Text(
                                tab,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: AppConstants.bodySize,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedTab == tab
                                      ? Color(AppConstants.luxuryGold)
                                      : Color(AppConstants.mediumGray),
                                ),
                              ),
                              if (_selectedTab == tab)
                                Container(
                                  margin: EdgeInsets.only(
                                    top: AppConstants.sm,
                                  ),
                                  height: 2,
                                  width: 30,
                                  color: Color(AppConstants.luxuryGold),
                                ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: AppConstants.lg),
            // Investment List
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppConstants.md),
              itemBuilder: (context, index) => _buildInvestmentCard(index),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestmentCard(int index) {
    final titles = [
      'Apple Stock',
      'Bitcoin',
      'Axis Mutual Fund',
      'Gold ETF',
      'Real Estate Trust',
    ];
    final amounts = ['₹45,000', '₹28,500', '₹32,000', '₹15,000', '₹44,500'];
    final returns = ['+12.5%', '+8.3%', '+15.7%', '+5.2%', '+20.1%'];
    final colors = [
      Color(AppConstants.emeraldGreen),
      Color(AppConstants.luxuryGold),
      Color(AppConstants.accentGold),
      Color(AppConstants.emeraldGreen),
      Color(AppConstants.accentGold),
    ];

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
              color: colors[index].withOpacity(0.2),
            ),
            child: Center(
              child: Icon(
                Icons.trending_up,
                color: colors[index],
                size: 20,
              ),
            ),
          ),
          SizedBox(width: AppConstants.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  amounts[index],
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.md,
              vertical: AppConstants.sm,
            ),
            decoration: BoxDecoration(
              color: colors[index].withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppConstants.radiusSm),
              border: Border.all(
                color: colors[index],
                width: 1,
              ),
            ),
            child: Text(
              returns[index],
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: AppConstants.smallSize,
                fontWeight: FontWeight.w600,
                color: colors[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
