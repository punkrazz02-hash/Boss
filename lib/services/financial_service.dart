import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/goal_model.dart';

class FinancialService {
  // Calculate net worth
  double calculateNetWorth({
    required double cash,
    required double bankBalance,
    required double investments,
    required double businessRevenue,
  }) {
    return cash + bankBalance + investments + businessRevenue;
  }

  // Calculate monthly savings
  double calculateMonthlySavings({
    required double totalIncome,
    required double totalExpenses,
  }) {
    return totalIncome - totalExpenses;
  }

  // Calculate savings percentage
  double calculateSavingsPercentage({
    required double savings,
    required double income,
  }) {
    if (income == 0) return 0;
    return (savings / income) * 100;
  }

  // Calculate financial health score
  int calculateFinancialHealthScore({
    required double netWorth,
    required double monthlyIncome,
    required double monthlyExpenses,
    required bool hasBudget,
    required bool hasEmergencyFund,
  }) {
    int score = 0;

    // Net worth score (max 25)
    if (netWorth > 1000000) score += 25;
    else if (netWorth > 500000) score += 20;
    else if (netWorth > 100000) score += 15;
    else if (netWorth > 0) score += 10;

    // Savings ratio (max 25)
    double savingsRatio =
        monthlyIncome > 0 ? (monthlyIncome - monthlyExpenses) / monthlyIncome : 0;
    if (savingsRatio > 0.5) score += 25;
    else if (savingsRatio > 0.3) score += 20;
    else if (savingsRatio > 0.1) score += 15;
    else if (savingsRatio > 0) score += 10;

    // Budget score (max 25)
    if (hasBudget) score += 25;

    // Emergency fund score (max 25)
    if (hasEmergencyFund) score += 25;

    return score;
  }

  // Get savings goal status
  String getSavingsGoalStatus(Goal goal) {
    if (goal.isCompleted) return 'Completed';
    final percentageComplete = (goal.progress * 100).toStringAsFixed(1);
    return '$percentageComplete% Complete';
  }

  // Get days until goal
  int getDaysUntilGoal(Goal goal) {
    if (goal.isCompleted) return 0;
    return goal.targetDate.difference(DateTime.now()).inDays;
  }
}

final financialServiceProvider = Provider((ref) {
  return FinancialService();
});
