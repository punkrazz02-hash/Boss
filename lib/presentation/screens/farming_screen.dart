import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_constants.dart';

class FarmingScreen extends StatefulWidget {
  const FarmingScreen({Key? key}) : super(key: key);

  @override
  State<FarmingScreen> createState() => _FarmingScreenState();
}

class _FarmingScreenState extends State<FarmingScreen> {
  int _selectedTabIndex = 0;
  final List<String> _farmTypes = ['Marigold', 'Layer Farming'];

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
          'Farming Management',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(AppConstants.lightGray),
          ),
        ),
      ),
      body: Column(
        children: [
          // Tab Selector
          Padding(
            padding: EdgeInsets.all(AppConstants.md),
            child: Row(
              children: List.generate(
                _farmTypes.length,
                (index) => Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTabIndex = index),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: AppConstants.md,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedTabIndex == index
                                ? Color(AppConstants.luxuryGold)
                                : Color(AppConstants.mediumGray),
                            width: 2,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _farmTypes[index],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: AppConstants.bodySize,
                            fontWeight: FontWeight.w600,
                            color: _selectedTabIndex == index
                                ? Color(AppConstants.luxuryGold)
                                : Color(AppConstants.mediumGray),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Content
          Expanded(
            child: _selectedTabIndex == 0
                ? _buildMarigoldContent()
                : _buildLayerFarmingContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildMarigoldContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.md),
      child: Column(
        children: [
          _buildFarmCard(
            title: 'Plant Count',
            value: '500',
            unit: 'plants',
            icon: '🌾',
            color: Color(AppConstants.emeraldGreen),
          ),
          SizedBox(height: AppConstants.lg),
          _buildFarmCard(
            title: 'Harvest Ready',
            value: '85',
            unit: 'days',
            icon: '⏰',
            color: Color(AppConstants.luxuryGold),
          ),
          SizedBox(height: AppConstants.lg),
          _buildFarmCard(
            title: 'Total Yield',
            value: '2,450',
            unit: 'flowers',
            icon: '💐',
            color: Color(AppConstants.accentGold),
          ),
          SizedBox(height: AppConstants.lg),
          _buildFarmCard(
            title: 'Revenue',
            value: '₹45,000',
            unit: 'this season',
            icon: '💰',
            color: Color(AppConstants.emeraldGreen),
          ),
          SizedBox(height: AppConstants.lg),
          _buildActionButton('Add Watering Log', Icons.water_drop),
          SizedBox(height: AppConstants.md),
          _buildActionButton('Disease Detection', Icons.health_and_safety),
          SizedBox(height: AppConstants.md),
          _buildActionButton('Harvest Planning', Icons.event_note),
        ],
      ),
    );
  }

  Widget _buildLayerFarmingContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.md),
      child: Column(
        children: [
          _buildFarmCard(
            title: 'Bird Count',
            value: '1,200',
            unit: 'birds',
            icon: '🐔',
            color: Color(AppConstants.accentGold),
          ),
          SizedBox(height: AppConstants.lg),
          _buildFarmCard(
            title: 'Daily Eggs',
            value: '1,100',
            unit: 'eggs',
            icon: '🥚',
            color: Color(AppConstants.luxuryGold),
          ),
          SizedBox(height: AppConstants.lg),
          _buildFarmCard(
            title: 'Feed Stock',
            value: '450',
            unit: 'bags',
            icon: '🌾',
            color: Color(AppConstants.emeraldGreen),
          ),
          SizedBox(height: AppConstants.lg),
          _buildFarmCard(
            title: 'Monthly Income',
            value: '₹1,10,000',
            unit: 'from eggs',
            icon: '💳',
            color: Color(AppConstants.emeraldGreen),
          ),
          SizedBox(height: AppConstants.lg),
          _buildActionButton('Feed Management', Icons.shopping_basket),
          SizedBox(height: AppConstants.md),
          _buildActionButton('Health Check', Icons.local_hospital),
          SizedBox(height: AppConstants.md),
          _buildActionButton('Sales Records', Icons.receipt_long),
        ],
      ),
    );
  }

  Widget _buildFarmCard({
    required String title,
    required String value,
    required String unit,
    required String icon,
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
                value,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
              Text(
                unit,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: AppConstants.smallSize,
                  fontWeight: FontWeight.w400,
                  color: Color(AppConstants.mediumGray),
                ),
              ),
            ],
          ),
          Text(
            icon,
            style: TextStyle(fontSize: 48),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon) {
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
