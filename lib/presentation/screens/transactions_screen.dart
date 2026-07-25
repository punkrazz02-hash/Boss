import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_constants.dart';
import '../widgets/music_player/music_selection_bottom_sheet.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Income', 'Expense', 'Transfer'];

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
          'Transactions',
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
            // Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters
                    .map(
                      (filter) => Padding(
                        padding: EdgeInsets.only(right: AppConstants.md),
                        child: FilterChip(
                          label: Text(filter),
                          selected: _selectedFilter == filter,
                          onSelected: (selected) {
                            setState(() => _selectedFilter = filter);
                          },
                          backgroundColor: Color(AppConstants.mediumGray),
                          selectedColor: Color(AppConstants.luxuryGold),
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: _selectedFilter == filter
                                ? Color(AppConstants.primaryBlack)
                                : Color(AppConstants.lightGray),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: AppConstants.lg),
            // Transaction List
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppConstants.md),
              itemBuilder: (context, index) {
                return _buildTransactionCard(context, index);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTransactionBottomSheet(context),
        backgroundColor: Color(AppConstants.luxuryGold),
        child: Icon(
          Icons.add,
          color: Color(AppConstants.primaryBlack),
        ),
      ),
    );
  }

  Widget _buildTransactionCard(BuildContext context, int index) {
    final icons = [Icons.shopping_cart, Icons.account_balance_wallet];
    final titles = [
      'Grocery Shopping',
      'Salary Deposit',
    ];
    final amounts = ['-₹850', '+₹45,000'];
    final colors = [
      Color(AppConstants.rubyRed),
      Color(AppConstants.emeraldGreen),
    ];

    final icon = icons[index % icons.length];
    final title = titles[index % titles.length];
    final amount = amounts[index % amounts.length];
    final color = colors[index % colors.length];

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
                  'Today',
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

  void _showAddTransactionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(AppConstants.primaryBlack),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConstants.radiusLg),
          topRight: Radius.circular(AppConstants.radiusLg),
        ),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(AppConstants.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add Transaction',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(AppConstants.luxuryGold),
              ),
            ),
            SizedBox(height: AppConstants.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTransactionTypeButton('Income', Icons.trending_up,
                    Color(AppConstants.emeraldGreen)),
                _buildTransactionTypeButton('Expense', Icons.trending_down,
                    Color(AppConstants.rubyRed)),
                _buildTransactionTypeButton('Transfer', Icons.swap_horiz,
                    Color(AppConstants.luxuryGold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionTypeButton(
    String label,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.2),
            border: Border.all(color: color, width: 2),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        SizedBox(height: AppConstants.sm),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: AppConstants.smallSize,
            fontWeight: FontWeight.w500,
            color: Color(AppConstants.lightGray),
          ),
        ),
      ],
    );
  }
}
